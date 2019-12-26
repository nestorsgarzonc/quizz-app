import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/question.dart';

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

  List<Question> questions = [
    Question(q: 'You can lead a cow down stairs but not up stairs', a: true),
    Question(
        q: 'Approximately one quarter of human bones are on the feet',
        a: false),
    Question(q: 'A slug\'s blood is green', a: true),
  ];

  int counter = 0;
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
            questions[counter].question,
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
              if (questions[counter].answer == true) {
                counter++;
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
              if (questions[counter].answer == false) {
                counter++;
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
