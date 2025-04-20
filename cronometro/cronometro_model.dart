import 'package:flutter/material.dart';
import 'dart:async';

class CronometroModel with ChangeNotifier { //Modelo de estado do cronômetro
  late Timer _timer;
  Duration _tempoDecorrido = Duration.zero;
  List<String> _temposRegistrados = [];
  bool _estaRodando = false;

  Duration get tempoDecorrido => _tempoDecorrido; //Get para acessar os dados do estado
  List<String> get temposRegistrados => _temposRegistrados;
  bool get estaRodando => _estaRodando;

  void iniciar() { //Inicia o cronômetro
    if (_estaRodando) return; //Não inicia se já estiver rodando

    _estaRodando = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) { //Atualiza o tempo a cada segundo
      _tempoDecorrido += Duration(seconds: 1);
      notifyListeners();
    });

    notifyListeners();
  }

  void parar() { //Para o cronõmetro
    if (_estaRodando) {
      _timer.cancel();
      _temposRegistrados.add(_formatarTempo(_tempoDecorrido)); //Registra o tempo final
      _estaRodando = false;
      _tempoDecorrido = Duration.zero;
      notifyListeners();
    }
  }

  String _formatarTempo(Duration duration) { //Formata o tempo em 00:00:00
    return duration.toString().split('.').first.padLeft(8, "0");
  }

  String get tempoFormatado => _formatarTempo(_tempoDecorrido); //Get para o tempo formatado
}