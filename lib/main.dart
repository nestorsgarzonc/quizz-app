import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/quizz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  List<Widget> scoreKeeper = [
    Icon(Icons.keyboard_arrow_right, color: Colors.white)
  ];
  QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _question(),
        _button(true),
        SizedBox(
          height: 10,
        ),
        _button(false),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }

  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      if (quizBrain.getAnswer() == userPickedAnswer) {
        quizBrain.nextQuestion();
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        if (quizBrain.hasMore() == false) {
          Alert(context: context, title: "Finish", desc: "You're awesome!.")
              .show();
        }
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        Alert(context: context, title: "Bad", desc: "Try again!.").show();
        scoreKeeper.clear();
      }
    });
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

  Widget _button(bool sign) {
    String text = 'False';
    Color color = Colors.red;
    if (sign) {
      text = 'True';
      color = Colors.green;
    }
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: FlatButton(
          color: color,
          textColor: Colors.white,
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () => checkAnswer(sign),
        ),
      ),
    );
  }
}
