import 'package:flutter/material.dart';
import 'package:fl_movies_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Movies'),actions: [
      
        IconButton(onPressed: null, icon: Icon(Icons.search,color: Colors.red,))
      ],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(),
      
            MovieSlider()
          ],
      
        ),
      ),
    );
  }
}
