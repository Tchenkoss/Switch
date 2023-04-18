import 'package:flutter/material.dart';

class DrawerChanger with ChangeNotifier {
  Drawer _drawerColor = Drawer();

  Drawer get drawerColor => _drawerColor;

  void changeDrawerColor(Drawer drawerColor) {
    _drawerColor = drawerColor;
    notifyListeners();
  }
}
