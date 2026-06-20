# Develop an application to Play Quiz and get the Score Board. 
 
import 'package:flutter/material.dart'; 
 
void main() => runApp(QuizApp()); 
 
class QuizApp extends StatefulWidget { 
  @override 
  _QuizAppState createState() => _QuizAppState(); 
} 
class _QuizAppState extends State { 
  final List<Map<String,Object>> _questions = [ 
    { 
      'question': 'What is the capital of India?', 
      'answers': [ 
        {'text': 'Mumbai', 'score': 0}, 
        {'text': 'Delhi', 'score': 1}, 
        {'text': 'Kolkata', 'score': 0}, ], },{ 
      'question': '2 + 2 = ?', 
      'answers': [ 
        {'text': '3', 'score': 0}, 
        {'text': '4', 'score': 1}, 
        {'text': '5', 'score': 0}, 
      ], }, ]; 
  int _currentIndex = 0; 
  int _totalScore = 0; 
  void _answerQuestion(int score) { 
    setState(() { 
      _totalScore += score; 
      _currentIndex++; 
    }); } 
  void _resetQuiz() { 
    setState(() { 
      _currentIndex = 0; 
      _totalScore = 0; 
    }); } 
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'Quiz App', 
      home: Scaffold( 
        appBar: AppBar(title: Text('Quiz App')), 
        body: _currentIndex < _questions.length 
            ? Column( 
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [ 
                  Text( 
                    _questions[_currentIndex]['question'] as String, 
                    style: TextStyle(fontSize: 22), 
                    textAlign: TextAlign.center, 
                  ), 
                  SizedBox(height: 20), 
                  ...(_questions[_currentIndex]['answers'] as List<Map<String,Object>>).map((answer) { 
                    return Padding( 
                      padding: const EdgeInsets.symmetric(vertical: 5), 
                      child: ElevatedButton( 
                        onPressed: () => _answerQuestion(answer['score'] as int), 
                        child: Text(answer['text'] as String), 
                      ), );}),],) 
            : Center( 
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [ 
                    Text('Your Score: $_totalScore', 
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), 
                    SizedBox(height: 20), 
                    ElevatedButton( 
                      onPressed: _resetQuiz, 
                      child: Text('Restart Quiz'), 
                    ),]), 
              ), 
      ), 
    ); 
  } 
}
