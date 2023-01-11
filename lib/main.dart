import 'package:flutter/material.dart';
import 'QuizBrain.dart';

QuizBrain brain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Center(
            child: Text(
              'Quizzler',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 1,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/venom2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          constraints: BoxConstraints.expand(),
          child: QuizPage(),
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
  List<Icon> scoreKeeper = [];
  void checkAnswer(bool userAnswer) {
    bool correctAnswer = brain.getCorrectAnswer();
    if (userAnswer == correctAnswer) {
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
    setState(() {
      brain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  brain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      backgroundColor: Colors.black,
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'True',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          )),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
