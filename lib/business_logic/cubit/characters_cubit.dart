import 'package:bloc/bloc.dart';
import 'package:flutter_breaking/data/models/AllCharacter.dart';
import 'package:flutter_breaking/data/repository/character_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;

  List<CharacterModel> characters = [];

  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  List<CharacterModel> getdata() {
    charactersRepo.getallcharecter().then((character) {
      emit(
        CharacterLoaded(character),
      );
      characters = character;
    });

    return characters;
  }
}
