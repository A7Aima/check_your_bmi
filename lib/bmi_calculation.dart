import 'dart:math';

import 'package:flutter/material.dart';

class BMICalculator {
  final int height;
  final int weight;
  BMICalculator({this.height, this.weight});

  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return "Overweight";
    } else if (_bmi >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25.0) {
      return 'You weight is higher than normal body weight. Try some exercise.';
    } else if (_bmi >= 18.5) {
      return "You have a normal body weight. Good Job!";
    } else {
      return "You weight is lower than normal body weight. Go eat something.";
    }
  }

  Color colorCheck() {
    if (_bmi >= 25.0) {
      return Colors.red;
    } else if (_bmi >= 18.5) {
      return Colors.green;
    } else {
      return Colors.yellow;
    }
  }
}
