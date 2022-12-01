import 'package:flutter/material.dart';
//instancia movies_provider
//Necesita extender de ChangeNotifier
class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('movies provider started...');
    //cuando el constructor sea llamado, mandamos a ejecutar los siguientes métodos
    getOnDisplayMovies();
  }
  //metodo 1
  getOnDisplayMovies() {
    print('get on display movies');
  }
}
