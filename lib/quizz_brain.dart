import 'package:quizz_app/question.dart';

class QuizBrain {
  int _counter = 0;
  List<Question> _questions = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs',
        answer: true),
    Question(
        question: 'Approximately one quarter of human bones are on the feet',
        answer: false),
    Question(question: 'A slug\'s blood is green', answer: true),
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
    } else {}
  }

  bool hasMore() {
    if (_counter >= _questions.length - 1) {
      return false;
    }
    return true;
  }

  int getCounter() {
    return _counter;
  }
}
