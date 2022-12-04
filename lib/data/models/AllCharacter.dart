// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_breaking/constants/assets_string.dart';

class CharacterModel {
  CharacterModel({
    this.charId,
    this.name,
    this.birthday,
    this.occupation,
    this.img,
    this.status,
    this.nickname,
    this.appearance,
    this.portrayed,
    this.category,
    this.betterCallSaulAppearance,
  });

  final int? charId;
  final String? name;
  final String? birthday;
  final List<String>? occupation;
  final String? img;
  final String? status;
  final String? nickname;
  final List<int>? appearance;
  final String? portrayed;
  final String? category;
  final List<int>? betterCallSaulAppearance;

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        charId: json["char_id"],
        name: json["name"],
        birthday: json["birthday"],
        occupation: List<String>.from(json["occupation"].map((x) => x)),
        img: json["img"],
        status: json["status"],
        nickname: json["nickname"],
        appearance: List<int>.from(json["appearance"].map((x) => x)),
        portrayed: json["portrayed"],
        category: json["category"],
        betterCallSaulAppearance:
            List<int>.from(json["better_call_saul_appearance"].map((x) => x)),
      );

  // Map<String, dynamic> toJson() => {
  //     "char_id": charId,
  //     "name": name,
  //     "birthday": birthdayValues.reverse[birthday],
  //     "occupation": List<dynamic>.from(occupation.map((x) => x)),
  //     "img": img,
  //     "status": statusValues.reverse[status],
  //     "nickname": nickname,
  //     "appearance": List<dynamic>.from(appearance.map((x) => x)),
  //     "portrayed": portrayed,
  //     "category": categoryValues.reverse[category],
  //     "better_call_saul_appearance": List<dynamic>.from(betterCallSaulAppearance.map((x) => x)),
  // };
}
