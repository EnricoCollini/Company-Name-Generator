import 'package:flutter/material.dart';
import './home.dart';
import "./savedPage.dart";

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/saved': (context) => SavedPage(),
    }
  ));
}
