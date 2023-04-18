import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  double slidervalue = 1.0;
  double get value => slidervalue;

  void setValue(double val) {
    slidervalue = val;
    notifyListeners();
  }
}
