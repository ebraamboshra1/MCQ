import 'package:flutter/material.dart';
import 'package:mcq/Provider/exam.dart';
import 'package:provider/provider.dart';

class ScorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exam = Provider.of<Exam>(context);
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: mediaQuery.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Dear ${exam.userName}"),
            SizedBox(
              height: mediaQuery.size.height * 0.05,
            ),
            Text("Your Score is ${exam.score}"),
            RaisedButton(
              onPressed: () {
                exam.answers = [];
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/', (Route<dynamic> route) => false);
              },
              child: Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }
}
