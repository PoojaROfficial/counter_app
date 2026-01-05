import 'package:flutter/material.dart';


class CounterNotifier extends ChangeNotifier {
  int count = 0;

  void increment() {
    if (count < 10) {
      count++;
      notifyListeners();
    }
  }

  bool decrement() {
    if (count > 0) {
      count--;

      notifyListeners();
      return true;
    }
    return false;
  }
}
