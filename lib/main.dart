import 'package:flutter/material.dart';
import 'quiz_brain.dart.dart';

QuizBrian quizBrian = QuizBrian();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(), // Add this line to show the QuizPage
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
  List<Icon> scoreKeeper = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
  ]; // Create the list for the scorekeeper

  List<Question> questionBank = [
  Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  Question(q: 'Approximately one quarter of human bones are in the feet.', a: true),
  Question(q: 'A slug\'s blood is green.', a: true),
  ];

  int questionNumber = 0;

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
                questionBank[questionNumber].questionText,
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
            child: TextButton(
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.green, // Button color
                padding: EdgeInsets.all(15.0), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, //Rectangle corners
                ),
              ),
              onPressed: () {
                bool correctAnswer = quizBrian.getCorrectAnswer(questionNumber);

                if (correctAnswer == true) {
                  print('User got it right!');
                } else {
                  print('User got it wrong.');
                }

                setState(() {
                  questionNumber++;
                });

                print(questionNumber);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red, // Button color
                padding: EdgeInsets.all(15.0), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, //Rectangle corners
                ),
              ),
              onPressed: () {
                bool correctAnswer = questionBank[questionNumber].questionAnswer;

                if (correctAnswer == false) {
                  print('User got it right!');
                } else {
                  print('User got it wrong.');
                }

                setState(() {
                  questionNumber++;
                });

                print(questionNumber);
              },
            ),
          ),
        ),
        Row(
          children: [],
        ),
      ],
    );
  }
}
