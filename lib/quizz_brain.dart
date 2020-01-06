import 'package:quizz_app/question.dart';

class QuizBrain {
  int _counter = 0;
  List<Question> _questions = [
    Question(q: 'You can lead a cow down stairs but not up stairs', a: true),
    Question(
        q: 'Approximately one quarter of human bones are on the feet',
        a: false),
    Question(q: 'A slug\'s blood is green', a: true),
  ];

  String getCuestionText() {
    return _questions[_counter].question;
  }

  bool getAnswer() {
    return _questions[_counter].answer;
  }

  void nextQuestion() {
    if (_counter < _questions.length - 1) {
      _counter++;
    }else{
      
    }
  }

  bool hasMore(){
    if(_counter>=_questions.length-1){
      return false;
    }
    return true;
  }

  int getCounter() {
    return _counter;
  }
}
