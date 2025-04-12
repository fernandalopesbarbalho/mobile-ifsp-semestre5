import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatefulWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  State<MeuAplicativo> createState() => _MeuAplicativoState();
}

class _MeuAplicativoState extends State<MeuAplicativo> {
  // Controle do tema atual (claro/escuro)
  int _temaAtual = 0;

  // Tema Claro Personalizado
  final ThemeData _temaClaro = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    primaryColor: Colors.teal,
    hintColor: Colors.amber,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.teal,
      ),
      bodyLarge: TextStyle(fontSize: 18.0, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black54),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.teal,
      elevation: 4.0,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.teal, width: 2),
      ),
    ),
  );

  // Tema Escuro Personalizado
  final ThemeData _temaEscuro = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.purple,
    primaryColor: Colors.purple,
    hintColor: Colors.deepOrange,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: const Color(0xFF121212),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
      bodyLarge: TextStyle(fontSize: 18.0, color: Colors.white70),
      bodyMedium: TextStyle(fontSize: 16.0, color: Colors.white54),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.purple,
      elevation: 4.0,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF1E1E1E),
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.purple, width: 2),
      ),
    ),
  );

  // Tema Médio Personalizado
  final ThemeData _temaMedio = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.amber,
    primaryColor: Colors.amber,
    hintColor: Colors.blue,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: const Color(0xFF0D1B2A),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.amber,
      ),
      bodyLarge: TextStyle(fontSize: 18.0, color: Colors.white70),
      bodyMedium: TextStyle(fontSize: 16.0, color: Colors.white54),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.amber,
      elevation: 4.0,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF102542),
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.amber, width: 2),
      ),
    ),
  );

  // Alternância entre temas
  void _alternarTema() {
    setState(() {
      _temaAtual = (_temaAtual + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData temaSelecionado;
    switch (_temaAtual) {
      case 1:
        temaSelecionado = _temaEscuro;
        break;
      case 2:
        temaSelecionado = _temaMedio;
        break;
      default:
        temaSelecionado = _temaClaro;
    }

    return MaterialApp(
      title: 'Exercício de Temas',
      theme: temaSelecionado,
      home: ExemploTemaPage(alternarTema: _alternarTema),
    );
  }
}

class ExemploTemaPage extends StatelessWidget {
  final VoidCallback alternarTema;

  const ExemploTemaPage({Key? key, required this.alternarTema})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplos de Temas'),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: alternarTema,
            tooltip: 'Alternar Tema',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Demonstração de Temas', style: tema.textTheme.displayLarge),
            const SizedBox(height: 20),
            Text(
              'Este é um exemplo de como usar temas no Flutter. Os temas permitem definir estilos consistentes em todo o aplicativo.',
              style: tema.textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card com Estilo Temático',
                      style: tema.textTheme.displayLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Os cards também seguem o tema atual. Note como as cores e elevações mudam entre os temas claro e escuro.',
                      style: tema.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Campo de Texto Temático',
                hintText: 'Digite algo aqui',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Botão Temático'),
                ),
                ElevatedButton(
                  onPressed: alternarTema,
                  child: const Text('Alternar Tema'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: tema.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: tema.primaryColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Container com Cores do Tema',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: tema.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Você pode acessar as cores do tema atual usando Theme.of(context) e aplicá-las aos seus widgets personalizados.',
                    style: tema.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: tema.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
