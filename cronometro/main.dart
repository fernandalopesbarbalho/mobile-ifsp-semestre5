import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; //Importa o provider
import 'cronometro_model.dart'; //Importa o model

void main() {
  //Inicia o app com o provider
  runApp(
    ChangeNotifierProvider(
      create: (_) => CronometroModel(), //Cria o modelo
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  //Cria o widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronômetro',
      home: CronometroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CronometroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cronometro = Provider.of<CronometroModel>(context); //Acessa o model

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 202, 97, 221),
        centerTitle: true,
        title: const Text(
          'Cronômetro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              cronometro.tempoFormatado, //Tela do cronômetro
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            Row( //Botões de iniciar e parar
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: cronometro.iniciar,
                  child: Text("Iniciar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: cronometro.parar,
                  child: Text("Parar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            Text(
              "Tempos Registrados:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            Expanded( //Lista de tempos anteriores
              child:
                  cronometro.temposRegistrados.isEmpty
                      ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Nenhum tempo registrado",
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                      : ListView.builder(
                        itemCount: cronometro.temposRegistrados.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  cronometro.temposRegistrados[index],
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
