import 'package:flutter/material.dart';
import 'routes/routes_generator.dart';

void main() {
  runApp(const MovieApp()); //Inicia o app
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Letterboxd',
      initialRoute: RouteGenerator.homePage, //Define a primeira rota a ser carregada
      onGenerateRoute: RouteGenerator.generateRoute, //Referencia o gerenciador que centraliza as rotas
      debugShowCheckedModeBanner: false,
    );
  }
}