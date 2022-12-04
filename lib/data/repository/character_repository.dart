import 'package:flutter_breaking/data/models/AllCharacter.dart';
import 'package:flutter_breaking/data/web_services/character_web_service..dart';

class CharactersRepo {
  final CharacterWebService characterWebService;

  CharactersRepo(this.characterWebService);

  Future<List<CharacterModel>> getallcharecter() async {
    final characters = await characterWebService.getallcharecter();
    final result = characters.map((e) => CharacterModel.fromJson(e)).toList();
    return result;
  }
}
