import 'package:flutter/material.dart';
import 'package:flutter_breaking/constants/assets_string.dart';
import 'package:flutter_breaking/constants/my_colors.dart';
import 'package:flutter_breaking/constants/string.dart';
import 'package:flutter_breaking/data/models/AllCharacter.dart';

class CharacterItem extends StatelessWidget {
  final CharacterModel character;

  const CharacterItem({super.key, required this.character});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
      padding: const EdgeInsetsDirectional.all(2),
      decoration: BoxDecoration(
        color: MyColor.myWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, characterDeteailscreen,
              arguments: character);
        },
        child: GridTile(
            footer: Hero(
              tag: character.charId!,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                alignment: Alignment.bottomCenter,
                child: Text(
                  '${character.name}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 2,
                    fontWeight: FontWeight.bold,
                    color: MyColor.myWhite,
                  ),
                ),
              ),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  height: double.infinity,
                  width: double.infinity,
                  placeholder: MyAssets.loading,
                  image: character.img!,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      MyAssets.empty,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Text('nodata');
                      },
                    );
                  },
                )
                // : Image.asset(MyAssets.loading),
                )),
      ),
    );
  }
}
