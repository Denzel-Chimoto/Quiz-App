import 'dart:ffi';

import 'package:rflutter_alert/rflutter_alert.dart';

import 'question.dart';
import 'main.dart';

int total = main.Qui
class Quizbrain {
  int _questionNumber = 0;


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

  void nextQuestion(context) {
    if (_questionNumber < _questions.length -1) {
      _questionNumber++;
    }
    else {
      {
        Alert(
          context: context,
          title: "RFLUTTER ALERT",
          desc: "You reached the finish and your score $",
        ).show();
    }
  }

  }
  void checkList(){

  }
}
