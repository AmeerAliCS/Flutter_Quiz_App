import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/Utils/question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  QuestionBrain questionBrain = QuestionBrain();
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userChoose){

    bool correctAnswer = questionBrain.getAnswer();
    setState(() {

      if(questionBrain.isFinished() == true){
        Alert(
            context: context,
            title: 'Finished !' ,
            desc: 'You\'ve reached the end of the quiz'
        ).show();
        questionBrain.reset();
        scoreKeeper = [];
      }

      else if(userChoose == correctAnswer){
        print('Correct');
        scoreKeeper.add(Icon(Icons.check , color: Colors.green,));
      }
      else{
        print('Wrong');
        scoreKeeper.add(Icon(Icons.close , color: Colors.red,));
      }
      questionBrain.nextQuestion();
    });


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                    child: Text(questionBrain.getQuestion() , style: TextStyle(color: Colors.white , fontSize: 20),)
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                    child: Text('True' , style: TextStyle(fontSize: 20),),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () => checkAnswer(true)
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Center(
                      child: Text('False' , style: TextStyle(fontSize: 20),)
                  ),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () => checkAnswer(false)
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: scoreKeeper
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
