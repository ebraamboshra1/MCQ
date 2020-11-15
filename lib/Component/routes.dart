
import 'package:flutter/material.dart';
import 'package:mcq/Pages/pages.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case 'score':
        return MaterialPageRoute(builder: (_) => ScorePage());
      case 'qa':
        return MaterialPageRoute(builder: (_) => QA());
      default:
        return MaterialPageRoute(builder: (_) => WelcomePage());
    }
  }
}
