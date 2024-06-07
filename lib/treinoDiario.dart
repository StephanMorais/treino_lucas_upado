import 'package:flutter/material.dart';
import 'espadalonga.dart';
import 'pistola.dart';
import 'wakisashi.dart';
import 'faca.dart';
import 'main.dart';

void main() {
  runApp(diario());
}

class diario extends StatelessWidget {
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
        '/': (context) => HomePageIndex(),
      },
      home: diarioTreino(),
    );
  }
}

class diarioTreino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String dayOfWeek = DateTime.now().weekday.toString();
    String dayMessage = '';

    switch (dayOfWeek) {
      case '1':
        dayMessage = 'HEMA';
        break;
      case '2':
        dayMessage = 'PISTOLA';
        break;
      case '3':
        dayMessage = 'DESCANSO';
        break;
      case '4':
        dayMessage = 'WAKISASHI';
        break;
      case '5':
        dayMessage = 'FACA';
        break;
      case '6':
        dayMessage = 'DESNCANSO';
        break;
      case '7':
        dayMessage = 'DESCANSO';
        break;
      default:
        dayMessage = '';
    }

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$dayMessage',
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
            ),
          ],
        ),
      ),
    );
  }
}
