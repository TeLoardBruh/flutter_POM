import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
          child: new Text(
        'Second Page Here',
        style: new TextStyle(fontSize: 20.0, color: Colors.green),
      )),
    );
  }
}
