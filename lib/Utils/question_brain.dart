
import 'package:quizapp/Utils/question.dart';

class QuestionBrain{
  int _numberQuestion = 0;
  List<Question> _questionBank = [
    Question(questionText: 'Some cats are actually allergic to humans' , questionAnswer: true),
    Question(questionText: 'You can lead a cow down stairs but not up stairs' , questionAnswer: false) ,
    Question(questionText: 'Approximately one quarter of human bones are in the feet' , questionAnswer: false) ,
    Question(questionText: 'It is illegal to pee in the Ocean in Portugal' , questionAnswer: true) ,
  ];

  bool isFinished(){
    if (_numberQuestion >= _questionBank.length -1 ){
      return true;
    }
    else{
      return false;
    }
  }

  void nextQuestion(){
    if(_numberQuestion < _questionBank.length -1){
      _numberQuestion ++;
    }
  }

  String getQuestion(){
    return _questionBank[_numberQuestion].questionText;
  }

  bool getAnswer(){
    return _questionBank[_numberQuestion].questionAnswer;
  }
  void reset(){
    _numberQuestion = 0;
  }
}