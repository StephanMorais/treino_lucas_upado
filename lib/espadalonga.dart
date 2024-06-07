import 'package:flutter/material.dart';
import 'dart:async';
import 'pistola.dart';
import 'wakisashi.dart';
import 'faca.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}

class Exercise {
  final String name;
  final String type;

  Exercise(this.name, this.type);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        'pistola.dart': (context) => ExercisepistolaPage(),
        'wakisashi.dart': (context) => ExercisewakisashiPage(),
        'faca.dart': (context) => ExercisefacaPage(),
        'espadalonga.dart': (context) => ExerciseespadaPage(),
        '/': (context) => HomePageIndex(),
      },
    );
  }
}

class ExerciseespadaPage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExerciseespadaPage> {
  List<Exercise> exercises = [
    Exercise("Giro com o pulso para frente", "repeticao"),
    Exercise("Giro como pulso para trás", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("Giro como pulso com as duas mãos para frente", "giro"),
    Exercise("Giro como pulso com as duas mãos para trás", "giro"),
    Exercise("DESCANSE", "descanso"),
    Exercise("DESCANSE", "descanso"),
    Exercise("Corte fendente com deslocamento", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("Corte volante com deslocamento", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("Corte sotano com mudança de guarda", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("Corte fendente com deslocamento lateral", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("Canguru com corte", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("Coverta com corte mão esquerda", "tempo"),
    Exercise("DESCANSE", "descanso"),
    Exercise("Coverta com corte mão direita", "tempo"),
    Exercise("DESCANSE", "descanso"),
    Exercise("Corte fendente com deslocamento", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("Corte volante com deslocamento", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("Corte sotano com mudança de guarda", "tempo"),
    Exercise("DESCANSE", "descanso"),
    Exercise("Corte fendente com deslocamento lateral", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("Canguru com corte", "repeticao"),
    Exercise("EXERCÍCIO CONCLUÍDO, PODE FECHAR O APLICATIVO!", 'final')
  ];

  int currentExerciseIndex = 0;
  Timer? _timer;
  int _tempoSeconds = 120;
  int _descansoSeconds = 10;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (exercises[currentExerciseIndex].type == "tempo") {
          if (_tempoSeconds > 0) {
            _tempoSeconds--;
          } else {
            _tempoSeconds = 120;
            _nextExercise();
          }
        } else if (exercises[currentExerciseIndex].type == "descanso") {
          if (_descansoSeconds > 0) {
            _descansoSeconds--;
          } else {
            _descansoSeconds = 10;
            _nextExercise();
          }
        }
      });
    });
  }

  void _nextExercise() {
    setState(() {
      currentExerciseIndex++;
      if (currentExerciseIndex >= exercises.length) {
        currentExerciseIndex = 0;
      }
    });
  }

  void _previousExercise() {
    setState(() {
      if (currentExerciseIndex > 0) {
        currentExerciseIndex--;
        if (currentExerciseIndex >= exercises.length) currentExerciseIndex = 0;
      } else {
        currentExerciseIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('Exercício ${currentExerciseIndex + 1}/${exercises.length}'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                exercises[currentExerciseIndex].name,
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              if (exercises[currentExerciseIndex].type == "tempo")
                Text(
                  '$_tempoSeconds',
                  style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              if (exercises[currentExerciseIndex].type == "repeticao")
                Text(
                  '15X CADA MÃO',
                  style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              if (exercises[currentExerciseIndex].type == "giro")
                Text(
                  '15X COM CADA GUARDA',
                  style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              if (exercises[currentExerciseIndex].type == "kata")
                Text(
                  '4X CADA SEQUENCIA',
                  style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              if (exercises[currentExerciseIndex].type == "descanso")
                Text(
                  '$_descansoSeconds',
                  style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              if (exercises[currentExerciseIndex].type == "repeticao")
                SizedBox(height: 18.0),
              if (exercises[currentExerciseIndex].type == "repeticao")
                ElevatedButton(
                    onPressed: () {
                      _nextExercise();
                    },
                    child: Text('PRONTO'),
                    style: ElevatedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0))),
              if (exercises[currentExerciseIndex].type == "kata")
                SizedBox(height: 18.0),
              if (exercises[currentExerciseIndex].type == "kata")
                ElevatedButton(
                  onPressed: () {
                    _nextExercise();
                  },
                  child: Text('PRONTO'),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _previousExercise();
                    },
                    child: Text('<ANTERIOR'),
                    style: ElevatedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _nextExercise();
                    },
                    child: Text('PROXIMO >'),
                    style: ElevatedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: const Text(
                  'INICIO',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ],
          ),
        ));
  }
}
