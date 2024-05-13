import 'package:flutter/material.dart';
import 'dart:async';
import 'espadalonga.dart';
import 'pistola.dart';
import 'wakisashi.dart';
import 'faca.dart';

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
        'faca': (context) => ExercisefacaPage(),
        'espadalonga': (context) => ExerciseespadaPage(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String dayOfWeek = DateTime.now().weekday.toString();
    String dayMessage = '';

    switch (dayOfWeek) {
      case '1':
        dayMessage = 'DIA DE TREINAR HEMA';
        break;
      case '2':
        dayMessage = 'DIA DE TREINAR PISTOLA';
        break;
      case '3':
        dayMessage = 'DIA DE DESCANSO';
        break;
      case '4':
        dayMessage = 'DIA DE TREINAR WAKISASHI';
        break;
      case '5':
        dayMessage = 'DIA DE TREINAR FACA';
        break;
      case '6':
        dayMessage = 'DIA DE DESNCANSO';
        break;
      case '7':
        dayMessage = 'DIA DE DESCANSO';
        break;
      default:
        dayMessage = '';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'TREINO DE ARMAMENTO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HOJE É $dayMessage',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                switch (dayOfWeek) {
                  case '1':
                    Navigator.pushReplacementNamed(context, 'espadalonga.dart');
                    break;
                  case '2':
                    Navigator.pushReplacementNamed(context, 'pistola.dart');
                    break;
                  case '4':
                    Navigator.pushReplacementNamed(context, 'wakisashi.dart');
                    break;
                  case '5':
                    Navigator.pushReplacementNamed(context, 'faca.dart');
                    break;
                  default:
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('SOSSEGA!'),
                      ),
                    );
                }
              },
              child: Text(
                'INICIAR',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
