import 'package:flutter/material.dart';
import 'package:singuplogin/pages/home.dart';
import 'package:singuplogin/pages/login.dart';
import 'package:singuplogin/pages/signup.dart';
import 'package:singuplogin/pages/about.dart';
import 'package:singuplogin/pages/books.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:singuplogin/pages/map.dart';
import 'package:singuplogin/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Splash(),
    '/home': (context) => Home(),
    '/login': (context) => Login(),
    '/signup': (context) => Signup(),
    '/about': (context) => About(),
    '/book': (context) => Book(),
    '/maps': (context) => Map(),
  }));
}
