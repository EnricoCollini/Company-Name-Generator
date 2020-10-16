import 'package:flutter/material.dart';
import './randomWords.dart';


class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Company Name Generator"),
        ),
        body: Center(
          child:  RandomWords(),
        ),
      );
  }
}
