import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mcq/Models/answer.dart';
import 'package:mcq/Models/question.dart';

class Exam with ChangeNotifier {
  String userName;
  int score = 0;
  int questionCount;
  List<AnswerModel> answers = [];
  List<QuestionModel> _questions = [
    QuestionModel(
      id: '1',
      question: 'Which of the Following is a primary number?',
      answers: [
        AnswerModel(id: '1', answer: '4', questionID: '1'),
        AnswerModel(id: '2', answer: '10', questionID: '1'),
        AnswerModel(id: '3', answer: '1', questionID: '1'),
        AnswerModel(id: '4', answer: '15', questionID: '1'),
      ],
      validAnswerID: '3',
    ),
    QuestionModel(
      id: '2',
      question: 'Which of the Following can fly?',
      answers: [
        AnswerModel(id: '1', answer: 'Bird', questionID: '2'),
        AnswerModel(id: '2', answer: 'Lion', questionID: '2'),
        AnswerModel(id: '3', answer: 'Cat', questionID: '2'),
        AnswerModel(id: '4', answer: 'Dog', questionID: '2'),
      ],
      validAnswerID: '1',
    ),
    QuestionModel(
      id: '3',
      question: 'Which of the Following is a Native android app Language?',
      answers: [
        AnswerModel(id: '1', answer: 'Java', questionID: '3'),
        AnswerModel(id: '2', answer: 'Dart', questionID: '3'),
        AnswerModel(id: '3', answer: 'J.S', questionID: '3'),
        AnswerModel(id: '4', answer: 'C#', questionID: '3'),
      ],
      validAnswerID: '1',
    ),
    QuestionModel(
      id: '4',
      question: 'Which of the Following is an even number',
      answers: [
        AnswerModel(id: '1', answer: '1523', questionID: '4'),
        AnswerModel(id: '2', answer: '8021', questionID: '4'),
        AnswerModel(id: '3', answer: '2153', questionID: '4'),
        AnswerModel(id: '4', answer: '3578', questionID: '4'),
      ],
      validAnswerID: '4',
    ),
    QuestionModel(
      id: '5',
      question: 'Which of the Following is an odd number?',
      answers: [
        AnswerModel(id: '1', answer: '4', questionID: '5'),
        AnswerModel(id: '2', answer: '10', questionID: '5'),
        AnswerModel(id: '3', answer: '11', questionID: '5'),
        AnswerModel(id: '4', answer: '12', questionID: '5'),
      ],
      validAnswerID: '3',
    ),
  ];
  List shuffle() {
    var random = new Random();
    var items = _questions;
    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
    return items;
  }

  List<QuestionModel> get questions {
    for(int i = 0;i< _questions.length;i++){
      _questions[i].answers.shuffle();
    }
    return shuffle();
  }


  clcScore() {
    score = 0;
    print(score);
    for (AnswerModel answerModel in answers) {
      for (QuestionModel questionModel in _questions) {
        if (questionModel.id == answerModel.questionID) {
          if (questionModel.validAnswerID == answerModel.id) {
            print(answerModel.id);
            score = score + 2;
          }
        }
      }
    }

    notifyListeners();
  }

  List<QuestionModel> answeredQuestions = [];


}
