import 'package:flutter/material.dart';
import '../data/movies_data.dart'; //Importa os dados dos filmes

class MoviesPage extends StatelessWidget {
  final String category;

  const MoviesPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final movies = moviesByCategory[category] ?? []; //Seleciona os filmes da categoria escolhida

    return Scaffold(
      appBar: AppBar(title: Text('Filmes de $category')),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (_, index) {
          final movie = movies[index];
          return ListTile( //Mostra os dados de cada filme
            title: Text(movie['title']),
            subtitle: Text('${movie['year']} - Nota: ${movie['rating']}'),
          );
        },
      ),
    );
  }
}
