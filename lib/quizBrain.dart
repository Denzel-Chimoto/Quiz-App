import 'dart:ffi';

import 'package:rflutter_alert/rflutter_alert.dart';

import 'question.dart';
import 'main.dart';

class Quizbrain {
  int _questionNumber = 0;
  int _score = 0;

  List<Question> _questions = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green', true)
  ];

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  bool checkAnswer(bool myAnswer) {
    bool currentQuestionAnswer = _questions[_questionNumber].questionAnswer;
    if (myAnswer == currentQuestionAnswer) {
      // Increment Score
      return true;
    } else {
      return false;
    }
  }

  void nextQuestion(context, score) {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    } else {
      print('your score is ');
      {
        Alert(
          context: context,
          title: "Denzel's Quiz App",
          desc: "You reached the finish and your score is $score",
        ).show();
      }
    }
  }

  void recordScores() {}
}
