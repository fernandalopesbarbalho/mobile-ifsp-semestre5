import 'package:flutter/material.dart';
import 'home_page.dart';
import 'movies_page.dart';

class RouteGenerator { //Classe responsável por organizar as rotas
  static const String homePage = '/'; //Rotas da aplicação
  static const String moviesPage = '/movies';

  RouteGenerator._(); 

  static Route<dynamic> generateRoute(RouteSettings settings) { //Onde é mapeado, carrega o nome das rotas
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage()); //Onde retorna a página
      case moviesPage:
        final category = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => MoviesPage(category: category)); //Abre a página de filmes, passando pela categoria escolhida
      default:
        throw Exception("Rota não encontrada: ${settings.name}");
    }
  }
}
