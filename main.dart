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

// import 'package:flutter/material.dart';

// void main() {
//   runApp(ScreenWidget());
// }

// class ScreenWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: const Text('Column & Row'),
//         ),
//         body: SimpleWidget(),
//       ),
//     );
//   }
// }

// class TextWidget extends StatelessWidget {
//   const TextWidget({Key key, this.text, this.color, this.width, this.fontSize})
//       : super(key: key);

//   final String text;
//   final Color color;
//   final double width;
//   final double fontSize;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       color: color,
//       child: Text(
//         text,
//         style: TextStyle(fontSize: fontSize),
//       ),
//     );
//   }
// }

// class SimpleWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         TextWidget(
//           color: Colors.limeAccent,
//           width: 120,
//           text: 'First',
//           fontSize: 50,
//         ),
//         TextWidget(
//           color: Colors.cyanAccent,
//           width: 180,
//           text: 'Second',
//           fontSize: 40,
//         ),
//         TextWidget(
//           color: Colors.purpleAccent,
//           width: 120,
//           text: 'Third',
//           fontSize: 30,
//         ),
//       ],
//     );
//   }
// }

// class SimpleWidget extends StatelessWidget {
//   const SimpleWidget({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Container(
//             //color: Colors.green,
//             child: Text(
//               'Panda',
//               style: TextStyle(fontSize: 40, color: Colors.black45),
//             ),
//             height: 300,
//             width: double.infinity,
//             alignment: Alignment.center,
//             //padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
//             margin: EdgeInsets.all(50),
//             //transform: Matrix4.rotationZ(0.1),
//             decoration: BoxDecoration(
//                 //gradient: LinearGradient(colors: [Colors.red, Colors.cyan])),
//                 //color: Colors.green,
//                 image: DecorationImage(
//                     image: Image.network(
//                             'https://chrome.google.com/webstore/detail/anime-girl-wallpapers-the/knafelepkckdmlkmflameacnfcjmcjfb?hl=ru')
//                         .image,
//                     fit: BoxFit.cover),
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(color: Colors.black))));
//   }
// }

// class SimpleWidget extends StatefulWidget {
//   @override
//   //SimpleWidgetState createState() => new SimpleWidgetState();
//   SimpleWidgetState createState() {
//     return new SimpleWidgetState();
//   }
// }

// class SimpleWidgetState extends State<SimpleWidget> {
//   int _count = 0;

//   void _handleButton() {
//     setState(() {
//       _count++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text('$_count'),
//           RaisedButton(
//             onPressed: () {
//               _handleButton();
//             },
//             child: Text('Click me!'),
//           )
//         ],
//       ),
//     );
//   }
// }
