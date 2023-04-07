
import 'package:flutter/material.dart';
import 'package:quiz/model/question.dart';
import 'package:get/get.dart';

class QuizScreen extends GetxController{
  String name= "";
  final List <Questions> _questionList =[
    Questions(Id: 1, 
    question: "Where was the Prophet Muhammad born?", 
    Answer: 2, 
    options: ['Medina', 'Jeddah', 'Mecca','Riyadh']
    ),
    Questions(Id: 2, 
    question: "How many surahs are there in the Quran?", 
    Answer: 1, 
    options: ['100', '114', '103','120']
    ),
    Questions(Id: 3, 
    question: "What is the age of the people in Paradise?", 
    Answer: 3, 
    options: ['24', '30', '28','33']
    ),
    Questions(Id: 4, 
    question: "How old was Prophet Muhammad when he received Prophethood", 
    Answer: 0, 
    options: ['40', '30', '35','29']
    )
  ];

  bool _isPressed = false;
  double _questionNo =1;
  int? _selectedAnswer;
  int _countOfCorrectAnswers =0;

  int get CountOfQuestion => _questionList.length;
  List<Questions> get questionList => [... _questionList];
  bool get isPressed => _isPressed;
  double get numberOfQuestions => _questionNo;
  int? get selectedAnswers => _selectedAnswer;
  int get countOfCorrectAnswer => _countOfCorrectAnswers;
  int? _correctAnswer;
  final Map<int,bool> _questionIsAnswered={};
  late PageController pageController;

  @override
  void onInit() {
    pageController= PageController(initialPage: 0);
    resetAnswer();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  double get scoreResult{
    return countOfCorrectAnswer *100 / questionList.length;
  }

  void checkAnswer(Questions question,int selectedAnswer){
    _isPressed=true;
    _selectedAnswer=selectedAnswer;
    _correctAnswer= question.Answer;
    if(_correctAnswer==_selectedAnswer){
      _countOfCorrectAnswers++;
      
    }
    _questionIsAnswered.update(Questions.Id, (value) => true);
    Future.delayed(const Duration(milliseconds: 500)).then((value) => nextQuestion);
    update();
  }
  bool checkIsAnswered(int QuesId){
    return _questionIsAnswered.entries.firstWhere((element) => element.key==QuesId).value;
  }

  void resetAnswer(){
    for(var element in _questionList){
      _questionIsAnswered.addAll({element.Id: false});
    }
    update();
  }

  Color getColor(int answerIndex){
    if(_isPressed){
      if(answerIndex== _correctAnswer){
        return Colors.green;
      }else if (answerIndex==_selectedAnswer && _correctAnswer!= _selectedAnswer){
        return Colors.red;
      }
    }
    return Colors.white;
  }
  IconData getIcon (int answerIndex){
    if(_isPressed){
      if(answerIndex== _correctAnswer){
        return Icons.done;
      }else if (answerIndex==_selectedAnswer && _correctAnswer!= _selectedAnswer){
        return Icons.close;
      }
    }
    return Icons.close;
  }

  nextQuestion(){
    if(pageController.page== _questionList.length-1){
      //TODO Navigation Result Screen
    }else{
      _isPressed=false;
      pageController.nextPage(duration: const Duration(microseconds: 500), curve: Curves.linear);
    }
    _questionNo =pageController.page!+2;
    update();
  }
  void startAgain(){
    _correctAnswer=null;
    _countOfCorrectAnswers=0;
    _selectedAnswer=null;
    resetAnswer();
    //TODO navigation Homescreen
  }

}

