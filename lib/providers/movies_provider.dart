import 'dart:convert';

import 'package:fl_movies_app/models/now_playing_response.dart';
import 'package:fl_movies_app/models/popular_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

//instancia movies_provider
//Necesita extender de ChangeNotifier

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '78fdfca86cfd9c3de43463f57599da37';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    print('movies provider started...');
    //cuando el constructor sea llamado, mandamos a ejecutar los siguientes métodos
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });
    final response = await http.get(url);
    return response.body;
  }

  //metodo 1
  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    //Nofica a los widgets cuando hay un cambio en la data.
    notifyListeners();
  }

  //metodo 1
  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    print(popularMovies);
    //Nofica a los widgets cuando hay un cambio en la data.
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    //this avoid new request! 
    if(moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}
