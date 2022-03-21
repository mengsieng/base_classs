import 'package:flutter/material.dart';

class BaseChangeNotifier extends ChangeNotifier {
  closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
