import 'package:flutter/material.dart';
import 'dart:async';

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
      home: ExercisefacaPage(),
    );
  }
}

class ExercisefacaPage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisefacaPage> {
  List<Exercise> exercises = [
    Exercise("3 perfurações", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("3 cortes", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("3 perfurações com guarda invertida", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("3 perfurações", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("3 cortes", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("3 perfurações com guarda invertida", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("3 perfurações", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("3 cortes", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("3 perfurações com guarda invertida", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("3 perfurações", "trepeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("3 cortes mão direita", "repeticao"),
    Exercise("DESCANSE", "descanso"),
    Exercise("3 perfurações com guarda invertida", "repeticao"),
    Exercise("EXERCÍCIO CONCLUÍDO, PODE FECHAR O APLICATIVO!", 'final'),
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
      } else {
        currentExerciseIndex = exercises.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String nextExerciseName = currentExerciseIndex + 1 < exercises.length
        ? exercises[currentExerciseIndex + 1].name
        : 'Nenhum';

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Exercício ${currentExerciseIndex + 1}/${exercises.length}'),
      ),
      body: Column(
        children: [
          if (exercises[currentExerciseIndex].type != "final")
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Próximo: $nextExerciseName',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          Expanded(
            child: Center(
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
                      '20X CADA MÃO',
                      style: TextStyle(fontSize: 30.0),
                      textAlign: TextAlign.center,
                    ),
                  if (exercises[currentExerciseIndex].type == "kata")
                    Text(
                      '4X',
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
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                    ),
                  if (exercises[currentExerciseIndex].type == "kata")
                    SizedBox(height: 18.0),
                  if (exercises[currentExerciseIndex].type == "kata")
                    ElevatedButton(
                      onPressed: () {
                        _nextExercise();
                      },
                      child: Text('PRONTO'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
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
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _nextExercise();
                        },
                        child: Text('PROXIMO >'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Text(
                      'INICIO',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
