import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {
  int count = 0;

  void increment() {
    if (count < 10) {
      count++;
      notifyListeners();
    }
  }

  void decrement(BuildContext context) {
    if (count > 0) {
      count--;
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Count cannot be less than 0"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
