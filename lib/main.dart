import 'package:flutter/material.dart';
import 'package:singuplogin/pages/home.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Home(),
  }));
}
