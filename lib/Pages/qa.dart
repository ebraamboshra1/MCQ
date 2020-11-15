import 'package:flutter/material.dart';
import 'package:mcq/Models/answer.dart';
import 'package:mcq/Models/question.dart';
import 'package:mcq/Provider/exam.dart';
import 'package:provider/provider.dart';

class QA extends StatefulWidget {
  @override
  _QAState createState() => _QAState();
}

class _QAState extends State<QA> {
  AnswerModel _answerModel;
  int questionNumber;
  List<QuestionModel> question = [];
  int i = 0;

  @override
  void initState() {
    final exam = Provider.of<Exam>(context, listen: false);
    question = exam.questions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final exam = Provider.of<Exam>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(question[i].question),
            ListView.builder(
                itemCount: question[i].answers.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return RadioListTile<AnswerModel>(
                    title: Text(
                      question[i].answers[index].answer,
                      style: const TextStyle(
                        color: Color(0xff1c305b),
                      ),
                    ),
                    value: question[i].answers[index],
                    groupValue: _answerModel,
                    onChanged: (AnswerModel value) {
                      setState(() {
                        _answerModel = value;
                      });
                    },
                  );
                }),
            RaisedButton(
              onPressed: () {
                if (exam.questionCount < question.length) {
                  exam.questionCount++;
                  print(exam.questionCount);

                  print('next');
                  exam.answers.add(_answerModel);
                  setState(() {
                    i++;
                  });
                } else {
                  print("here");
                  exam.answers.add(_answerModel);
                  exam.answeredQuestions = [];
                  exam.clcScore();
                  Navigator.of(context).pushNamed('score');
                }
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
