import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  // Function prevents the question number from exceeding the bank
  void nextQuestion(){
    if (_questionNumber < _questionBank.length-1){
      _questionNumber++;
    }
  }

  // Fixed typo: getQuetionText -> getQuestionText
  String getQuestionText() {  // Fixed: was getQuetionText
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  // Method to check whether question number has reach the last index of the bank
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      // print statement to check that isFinished is returning true when you are indeed at the end of the quiz.
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  // Reset the questions
  void reset() {
    _questionNumber = 0;
  }
}