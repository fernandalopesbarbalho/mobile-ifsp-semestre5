import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Ícones',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IconListScreen(),
    );
  }
}

class IconListScreen extends StatelessWidget { //Lista de ícones do flutter
  final List<Map<String, dynamic>> icons = [
    {"icon": Icons.home, "label": "Home"},
    {"icon": Icons.favorite, "label": "Favoritos"},
    {"icon": Icons.settings, "label": "Configurações"},
    {"icon": Icons.email, "label": "Email"},
    {"icon": Icons.person, "label": "Pessoa"},
    {"icon": Icons.notifications, "label": "Notificação"},
    {"icon": Icons.camera_alt, "label": "Câmera"},
    {"icon": Icons.share, "label": "Compartilhar"},
    {"icon": Icons.send, "label": "Enviar"},
    {"icon": Icons.delete, "label": "Lixeira"},
    {"icon": Icons.edit, "label": "Editar"},
  ];

  void _showSnackbar(BuildContext context, String message) { //Mensagem que aparece na tela ao clicar no item
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Você selecionou o ícone $message"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Ícones"), //Header
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder( //Listview chamando o método builder
          itemCount: icons.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(icons[index]["icon"], color: Colors.blue),
                title: Text(icons[index]["label"]),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _showSnackbar(context, icons[index]["label"]),
              ),
            );
          },
        ),
      ),
    );
  }
}
