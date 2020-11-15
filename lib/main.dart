import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Component/routes.dart';
import 'Provider/exam.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Exam exam = Exam();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: exam,
        ),
      ],
      child: MaterialApp(
        title: 'MCQ EXAM',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
