import 'package:flutter/material.dart';

import 'selecao.dart';
import 'treinoDiario.dart';
import 'espadalonga.dart';
import 'pistola.dart';
import 'wakisashi.dart';
import 'faca.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redirecionamento de Páginas Externas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'pistola.dart': (context) => ExercisepistolaPage(),
        'wakisashi.dart': (context) => ExercisewakisashiPage(),
        'faca.dart': (context) => ExercisefacaPage(),
        'espadalonga.dart': (context) => ExerciseespadaPage(),
        'selecao.dart': (context) => selecao(),
        'treinoDiario.dart': (context) => diarioTreino(),
        'main': (context) => HomePageIndex(),
      },
      home: HomePageIndex(),
    );
  }
}

class HomePageIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'TREINO MARCIAL',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'selecao.dart');
              },
              child: Text(
                'ESCOLHA SEU TREINO',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'treinoDiario.dart');
              },
              child: Text(
                'FAÇA O TREINO DIÁRIO',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
