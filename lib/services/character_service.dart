import 'dart:convert';

import '../constantes.dart';
import '../models/character.dart';
import 'package:http/http.dart' as http;

class CharacterService {

 Future<List<Character>> getCharacter() async {
    final response = await http.get(Uri.parse('$BASE_URL/character'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body) ["results"];
      return data.map<Character>((item) => Character.fromJson(item)).toList();
 } else {
      throw Exception("Falha ao buscar os personagens");
    }
  }
}