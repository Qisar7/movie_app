part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharacterLoaded extends CharactersState {
  final List<CharacterModel> character;

  CharacterLoaded(this.character);
}

class CharacterErorrCase extends CharactersState {}
