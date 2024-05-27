import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];
  int total = 0;
  int queTracker = 0;
  bool correct = false;

  //The following initializes a Quizbrain Object
  Quizbrain quizzes = Quizbrain();

  // Method to change state according to answer
  void updateUI(bool myAnswer){
    bool feedBack = quizzes.checkAnswer(myAnswer);
    if (feedBack){
      setState(() {
        total++;
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.lightBlue,
        ));
      });
    }else{
      setState(() {
        scorekeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      });
    }

    quizzes.nextQuestion(context, total);
  }

  // void checkAnswer(bool userPickedAnswer) {
  //   bool correctAnswer = quizzes.getQuestionAnswer();
  //   if (queTracker <= 3) {
  //     if (correctAnswer == userPickedAnswer) {
  //       setState(() {
  //         total++;
  //
  //         scorekeeper.add(Icon(
  //           Icons.check,
  //           color: Colors.lightBlue,
  //         ));
  //       });
  //     } else {
  //       setState(() {
  //         scorekeeper.add(Icon(
  //           Icons.close,
  //           color: Colors.red,
  //         ));
  //       });
  //     }
  //   } else {
  //     // Trigger Alert Box
  //     quizzes.nextQuestion(context);
  //   }
  //
  //   quizzes.nextQuestion(context);
  //   queTracker++;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizzes.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
              updateUI(true);


              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
               updateUI(false);
              },
            ),
          ),
        ),
        Row(children: scorekeeper),
      ],
    );
  }
}
