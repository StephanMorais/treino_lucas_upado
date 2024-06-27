import 'package:flutter/material.dart';
import 'pistola.dart';
import 'wakisashi.dart';
import 'faca.dart';
import 'espadalonga.dart';
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
        'pistola.dart': (context) => ExercisePistolaPage(),
        'wakisashi.dart': (context) => ExerciseWakisashiPage(),
        'faca.dart': (context) => ExercisefacaPage(),
        'espadalonga.dart': (context) => ExerciseespadaPage(),
        '/': (context) => HomePageIndex(),
      },
      home: selecao(),
    );
  }
}

class selecao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String dayMessage = '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
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
            Text(
              '$dayMessage',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'espadalonga.dart');
              },
              child: const Text(
                'ESPADA LONGA',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'pistola.dart');
              },
              child: const Text(
                'PISTOLA',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'faca.dart');
              },
              child: const Text(
                'FACA',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'wakisashi.dart');
              },
              child: const Text(
                'WAKISASHI',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text(
                'VOLTAR',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
