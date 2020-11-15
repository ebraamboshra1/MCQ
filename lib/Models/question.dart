import 'answer.dart';

class QuestionModel{
  final String id,question ,validAnswerID;
  final List<AnswerModel> answers;

  QuestionModel({this.id, this.question, this.answers,this.validAnswerID});
}