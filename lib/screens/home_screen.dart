import 'package:fl_movies_app/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);


    return  Scaffold(
      appBar: AppBar(title: const Text('Movies'),actions: [
      
        IconButton(onPressed: null, icon: Icon(Icons.search,color: Colors.red,))
      ],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
      
            MovieSlider(
              movies: moviesProvider.popularMovies, 
              title:'Populares',
              onNextPage: ()=>moviesProvider.getPopularMovies(),
            )
          ],
      
        ),
      ),
    );
  }
}
