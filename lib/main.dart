import 'file:///D:/Project%20Collection/Flutter_Projects/check_your_bmi/lib/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => InputPage(),
        "/result_page": (context) => ResultPage(),
      },
    );
  }
}
