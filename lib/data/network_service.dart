import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {
  final baseUrl = "http://www.omdbapi.com/?s=Harry&apikey=87d10179";

  Future<List<dynamic>> fetchMovies() async {
    try {
      final response = await get(Uri.parse(baseUrl ));
      print(response.body);
      return jsonDecode(response.body)["Search"] as List;
    } catch (e) {
      print(e);
      return [];
    }
  }

}