import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_breaking/constants/assets_string.dart';
import 'package:flutter_breaking/constants/my_colors.dart';
import 'package:flutter_breaking/data/models/AllCharacter.dart';

class Character_deteails extends StatelessWidget {
  final CharacterModel characterModel;

  const Character_deteails({super.key, required this.characterModel});

  Widget _buildappbarsliver() {
    return SliverAppBar(
      expandedHeight: 500,
      pinned: true,
      stretch: true,
      backgroundColor: MyColor.myGrey,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(characterModel.nickname!),
        centerTitle: true,
        background: Hero(
          tag: characterModel.charId!,
          child: Image.network(
            characterModel.img!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                MyAssets.empty,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget characterinfo(String name, String val) {
    return Text.rich(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      TextSpan(children: [
        TextSpan(
          text: name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextSpan(
          text: val,
          style: const TextStyle(
            fontSize: 15,
            color: MyColor.myWhite,
          ),
        ),
      ]),
    );
  }

  Widget divider(double indent) {
    return Divider(
      height: 20,
      color: MyColor.myYallow,
      endIndent: indent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myGrey,
      body: CustomScrollView(
        slivers: [
          _buildappbarsliver(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterinfo(
                        "name  :  ",
                        characterModel.name!,
                      ),
                      divider(20 * 14),
                      const SizedBox(height: 20),
                      characterinfo(
                        "Jobs :  ",
                        characterModel.occupation!.join(' / '),
                      ),
                      divider(20 * 14),
                      const SizedBox(height: 20),
                      characterinfo(
                        "NikeName :  ",
                        characterModel.nickname!,
                      ),
                      divider(20 * 12),
                      const SizedBox(height: 20),
                      characterinfo(
                        "category :  ",
                        characterModel.category!,
                      ),
                      divider(20 * 11),
                      const SizedBox(height: 20),
                      characterinfo(
                        "appearance in :  ",
                        characterModel.appearance!.join(' / '),
                      ),
                      divider(20 * 11),
                      const SizedBox(height: 20),
                      characterinfo(
                        "Status  :  ",
                        characterModel.status!,
                      ),
                      divider(20 * 13),
                      const SizedBox(height: 20),
                      characterinfo(
                        "birthday :  ",
                        characterModel.birthday!,
                      ),
                      divider(20 * 13),
                      const SizedBox(height: 20),
                      characterinfo(
                        "portrayed :  ",
                        characterModel.portrayed!,
                      ),
                      divider(20 * 12),
                      const SizedBox(
                        height: 300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
