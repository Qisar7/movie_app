import 'package:dio/dio.dart';
import 'package:flutter_breaking/constants/string.dart';
import 'package:flutter_breaking/data/models/AllCharacter.dart';

class CharacterWebService {
  late Dio dio;

  CharacterWebService() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 20 second
      receiveTimeout: 20 * 1000, // 20 second
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getallcharecter() async {
    try {
      final response = await dio.get('Characters');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
