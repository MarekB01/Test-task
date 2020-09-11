import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyPage()));
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => new _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final Random _random = Random();

  Color _color = Color(0xFFFFFFFF);

  void changeColor() {
    setState(() {
      _color = Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Example excercise',
        ),
        backgroundColor: Colors.amber,
      ),
      body: InkWell(
        onTap: changeColor,
        child: Container(
            color: _color,
            child: Container(
              child: Text(
                'Hey there',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, color: Colors.black45),
              ),
              height: 820,
              width: 500,
            )),
      ),
    );
  }
}

