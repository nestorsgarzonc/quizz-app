import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/quizz_brain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: QuizzPage(),
          ),
        ),
      ),
    );
  }
}

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Widget> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _question(),
        _trueButton(),
        SizedBox(
          height: 10,
        ),
        _falseButton(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }

  Widget _question() {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            quizBrain.getCuestionText(),
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _trueButton() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: FlatButton(
          color: Colors.green,
          textColor: Colors.white,
          child: Text(
            'True',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              if (quizBrain.getAnswer() == true) {
                quizBrain.nextQuestion();
                scoreKeeper.add(Icon(Icons.check, color: Colors.green));
              } else {
                scoreKeeper.add(Icon(Icons.close, color: Colors.red));
              }
            });
          },
        ),
      ),
    );
  }

  Widget _falseButton() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: FlatButton(
          color: Colors.red,
          textColor: Colors.white,
          child: Text(
            'False',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              if (quizBrain.getAnswer() == false) {
                quizBrain.nextQuestion();
                scoreKeeper.add(Icon(Icons.check, color: Colors.green));
              } else {
                scoreKeeper.add(Icon(Icons.close, color: Colors.red));
              }
            });
          },
        ),
      ),
    );
  }
}
