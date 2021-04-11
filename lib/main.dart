import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(CronometroPage());
}

class CronometroPage extends StatefulWidget {
  @override
  _CronometroPageState createState() => _CronometroPageState();
}

class _CronometroPageState extends State<CronometroPage> {
  double tempo = 0.0;
  double incremento = 0.0;

  void incrementar(){
    setState(() {
      tempo += incremento;
      Timer(Duration(microseconds: 1000), (){
        print(DateTime.now());
        incrementar();
      });
    });
  }

  String formatar(double valor){
    print('nosso valor$valor');
    String strValor = valor.toStringAsPrecision(2);
    print('nosso valor com 2 $strValor');
    return valor.toStringAsPrecision(2);

  }

  void executarAcao(String acao) {

    switch (acao) {
      case 'play':
        incremento = 0.1;
        break;
      case 'pause':
        incremento = 0.0;
        break;
      default:
        incremento = 0.0;
    }
    incrementar();
  }

  Widget botaoAcao(String acao) {
    IconData icone;
    switch (acao) {
      case 'play':
        icone = Icons.play_arrow;
        break;
      case 'pause':
        icone = Icons.pause;
        break;
      default:
        icone = Icons.stop;
    }

    return TextButton(
      child: Icon(icone, color: Colors.deepPurple, size: 50),
      onPressed: () {
        executarAcao(acao);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cronometro'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            Expanded(
                flex: 5,
                child: Center(
                    child: Text(
                  formatar(tempo),
                  style: TextStyle(fontSize: 50),
                ))),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    botaoAcao('play'),
                    botaoAcao('pause'),
                    botaoAcao('stop'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
