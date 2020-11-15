import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mcq/Provider/exam.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String name;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: mediaQuery.size.height * 0.05,
            ),
            Text(
              'Welcome to MCQ EXAM',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.1,
            ),
            Row(
              children: [
                SizedBox(
                  width: mediaQuery.size.width * 0.1,
                ),
                Text('Enter your Name'),
              ],
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.01,
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.1),
              child: TextField(
                decoration: InputDecoration(hintText: "Name"),
                onChanged: (value) {
                  name = value;
                },
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.05,
            ),
            RaisedButton(
              onPressed: () {
                if (name.isNotEmpty) {
                  Provider.of<Exam>(context, listen: false).questionCount =1;
                  Provider.of<Exam>(context, listen: false).userName = name;
                  Navigator.of(context)
                      .pushNamed('qa');
                }
              },
              child: Text('Enroll'),
            )
          ],
        ),
      ),
    );
  }
}
