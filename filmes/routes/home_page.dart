import 'package:flutter/material.dart';
import 'routes_generator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> categories = const [ //Lista de categorias e seus ícones
    {'name': 'Ação', 'icon': Icons.local_fire_department},
    {'name': 'Comédia', 'icon': Icons.emoji_emotions_outlined},
    {'name': 'Drama', 'icon': Icons.theater_comedy},
    {'name': 'Ficção Científica', 'icon': Icons.rocket_sharp},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categorias de Filmes')),
      body: ListView( //Mostra a lista
        children: categories.map((category) {
          return ListTile(
            leading: Icon(category['icon']),
            title: Text(category['name']),
            onTap: () { //Ao clicar, carrega a página da categoria selecionada
              Navigator.pushNamed(
                context,
                RouteGenerator.moviesPage,
                arguments: category['name'], //Passa o nome da categoria como argumento
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
