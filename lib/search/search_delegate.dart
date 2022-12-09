import 'package:fl_movies_app/models/models.dart';
import 'package:fl_movies_app/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Search Movie...';
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          //close from SearchDelegate
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('buildResult');
  }

  Widget _EmptyContainer() {
    return Container(
      child: Center(
          child: Icon(
        Icons.movie_creation_outlined,
        color: Colors.black38,
        size: 130,
      )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //query from SearchDelegate
    if (query.isEmpty) {
      return _EmptyContainer();
    }

    //accedemos al provider global
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.searchMovies(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return _EmptyContainer();
        final movies = snapshot.data!;
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, int index) => _MovieItem(movies[index]),
        );
      },
    );
    /* return Text('buildSuggestions $query'); */
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  const _MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: AssetImage('assets/no-image.jpg'),
        image: NetworkImage(movie.fullPosterImg),
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}
