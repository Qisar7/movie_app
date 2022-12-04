import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_breaking/constants/assets_string.dart';
import 'package:flutter_breaking/constants/my_colors.dart';
import 'package:flutter_breaking/data/models/AllCharacter.dart';
import 'package:flutter_breaking/data/web_services/character_web_service..dart';
import 'package:flutter_breaking/presentation/widgets/character_item.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Character_home extends StatefulWidget {
  @override
  State<Character_home> createState() => _Character_homeState();
}

class _Character_homeState extends State<Character_home> {
  late List<CharacterModel> allcharacter;
  late List<CharacterModel> listsearchedcharacter;
  bool _isSearching = false;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getdata();
  }

  Widget _BuildSearchFiled() {
    return TextField(
      controller: _searchController,
      cursorColor: MyColor.myGrey,
      decoration: const InputDecoration(
        hintText: 'Find a chracter ....',
        border: InputBorder.none,
      ),
      onChanged: (char) {
        addSearchedForiteminList(char);
      },
    );
  }

  void addSearchedForiteminList(String char) {
    listsearchedcharacter = allcharacter
        .where((character) => character.name!.toLowerCase().startsWith(char))
        .toList();
    setState(() {});
  }

  List<Widget> _buildappbarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearching();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startsearching,
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ];
    }
  }

  void _startsearching() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: _stopSearching),
    );
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearching();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearching() {
    setState(() {
      _searchController.clear();
    });
  }

  Widget buildblocwidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          allcharacter = (state).character;
          return buildLoadedWidget();
        } else {
          return showCircularProgress();
        }
      },
    );
  }

  Widget showCircularProgress() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColor.myYallow,
      ),
    );
  }

  Widget buildLoadedWidget() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            buildcharacterlist(),
          ],
        ),
      ),
    );
  }

  Widget buildcharacterlist() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: _searchController.text.isEmpty
          ? allcharacter.length
          : listsearchedcharacter.length,
      itemBuilder: (BuildContext context, int i) {
        return CharacterItem(
          character: _searchController.text.isEmpty
              ? allcharacter[i]
              : listsearchedcharacter[i],
        );
      },
    );
  }

  Widget _buildAppbartitle() {
    return const Text(
      'BREAKING BAD ',
      style: TextStyle(color: Colors.black),
    );
  }

  Widget buildnointernetwidght() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            'No Internet Connection !',
            style: TextStyle(
              fontSize: 18,
              color: MyColor.myWhite,
            ),
          ),
          const SizedBox(height: 20),
          LimitedBox(
            maxHeight: 200,
            maxWidth: 200,
            child: SvgPicture.asset(
              MyAssets.nointernet,
              width: 200,
              height: 200,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myGrey,
      appBar: AppBar(
        title: _isSearching ? _BuildSearchFiled() : _buildAppbartitle(),
        actions: _buildappbarActions(),
        leading: _isSearching
            ? const BackButton(
                color: Colors.black,
              )
            : const SizedBox(),
        centerTitle: true,
        backgroundColor: MyColor.myYallow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivityResult, Widget widget) {
          final bool connected = connectivityResult != ConnectivityResult.none;
          if (connected) {
            return buildblocwidget();
          } else {
            return buildnointernetwidght();
          }
        },
        child: showCircularProgress(),
      ),
    );
  }
}
