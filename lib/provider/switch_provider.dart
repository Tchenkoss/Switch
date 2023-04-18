import 'package:flutter/material.dart';

class SwitchProvider with ChangeNotifier {
  bool _isSwitched = false;

  bool get isSwitched => _isSwitched;

  toogleSwitch(bool value) {
    _isSwitched = value;
    notifyListeners();
  }
}
