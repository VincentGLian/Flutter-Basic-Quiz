import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What",
      "answers": [
        {"text": "Red", "score": 10},
        {"text": "Black", "score": 5},
        {"text": "Blue", "score": 1}
      ],
    },
    {
      "questionText": "Why",
      "answers": [
        {"text": "Cat", "score": 10},
        {"text": "Dog", "score": 5},
        {"text": "Bird", "score": 1}
      ],
    },
    {
      "questionText": "Who",
      "answers": [
        {"text": "He", "score": 5},
        {"text": "She", "score": 10},
        {"text": "It", "score": 1}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
