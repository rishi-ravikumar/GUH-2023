import 'question.dart';

class QuizBrain {
  late int _questionNumber = 0;

  final List<Questions> _questionBank = [
    Questions(
        questionText: 'Lions are in the cat family.', questionAnswer: true),
    Questions(questionText: '20 - 12 = 10', questionAnswer: false),
    Questions(
        questionText: 'A group of pigeons is called a cacophony.',
        questionAnswer: false),
    Questions(questionText: '33 * 3 = 99', questionAnswer: true),
    Questions(
        questionText: 'Buzz Aldrin was the first man to set foot on the moon.',
        questionAnswer: false),
    Questions(
        questionText: 'Matter is made up of atoms.', questionAnswer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  // This methods is now acts as a getter and setter (Encapsulation in action).

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
