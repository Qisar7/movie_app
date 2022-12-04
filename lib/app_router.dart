import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_breaking/constants/string.dart';
import 'package:flutter_breaking/data/models/AllCharacter.dart';
import 'package:flutter_breaking/data/repository/character_repository.dart';
import 'package:flutter_breaking/data/web_services/character_web_service..dart';
import 'package:flutter_breaking/presentation/screens/character_deteails.dart';
import 'package:flutter_breaking/presentation/screens/chracter_home.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepo = CharactersRepo(CharacterWebService());
    charactersCubit = CharactersCubit(charactersRepo);
  }

  Route? generateroute(RouteSettings settings) {
    switch (settings.name) {
      case charactersscreen:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              create: (BuildContext context) => charactersCubit,
              child: Character_home(),
            );
          },
        );

      case characterDeteailscreen:
        final character = settings.arguments as CharacterModel;
        return MaterialPageRoute(
            builder: (_) => Character_deteails(
                  characterModel: character,
                ));
    }
  }
}
