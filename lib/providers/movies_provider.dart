import 'dart:convert';

import 'package:fl_movies_app/models/now_playing_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//instancia movies_provider
//Necesita extender de ChangeNotifier

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '78fdfca86cfd9c3de43463f57599da37';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  MoviesProvider() {
    print('movies provider started...');
    //cuando el constructor sea llamado, mandamos a ejecutar los siguientes métodos
    getOnDisplayMovies();
  }

  //metodo 1
  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    print(nowPlayingResponse.results[1].title);
  }
}
