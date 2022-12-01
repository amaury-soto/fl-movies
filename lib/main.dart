
import 'package:flutter/material.dart';
import 'package:fl_movies_app/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:fl_movies_app/providers/movies_provider.dart';

void main() => runApp(const AppState());

//en AppState mantedremos el estado de nuestra app
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      //inicializamos las instancias, en este caso iniciamos instancia de movies_provider
      ChangeNotifierProvider(create: (_)=> MoviesProvider(), lazy: false,)
    ],
    child: MyApp(),
    
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color:Colors.black,
        )
      ) ,
    );
  }
}
