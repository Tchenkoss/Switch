import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  final List<int> _selectedItems = [];
  List<int> get selectedItem => _selectedItems;

  void addItem(int value) {
    _selectedItems.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _selectedItems.remove(value);
    notifyListeners();
  }
}
