// import 'dart:math';
// import 'package:flutter/material.dart';

// class SandGlass {
//   int _sand = 0;
//   time() {
//     return _sand;
//   } //time

//   Future tick() async {
//     _sand = 100;
//     print('Start:tick');
//     while (_sand > 0) {
//       print('tick: _sand');
//       _sand--;
//       await new Future.delayed(const Duration(milliseconds: 100));
//     } //while
//     print('End:tick');
//   } //tick
// } //SandGlass

// class MyApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => MyAppState();
// }

// class MyAppState extends State {
//   SandGlass clock = SandGlass();
//   _reDrawWidget() async {
//     if (clock.time() == 0) return;
//     await new Future.delayed(const Duration(seconds: 1));
//     setState(() {
//       print('reDrawWidget()');
//     });
//   }

//   @override
//   void initState() {
//     clock.tick();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _reDrawWidget();
//     print('clock.tick: ${clock.time()}');
//     return Center(child: Text('time is: ${clock.time()}'));
//   }
// }

// void main() => runApp(new MaterialApp(home: Scaffold(body: MyApp())));

//правильний перехід між екранами через route
// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Главное окно')),
//       body: Center(
//           child: Column(
//         children: [
//           RaisedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/second');
//               },
//               child: Text('Открыть второе окно')),
//           RaisedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/second/123');
//               },
//               child: Text('Открыть второе окно 123')),
//         ],
//       )),
//     );
//   }
// }

// class SecondScreen extends StatelessWidget {
//   String _id;
//   SecondScreen({String id}) : _id = id;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Второе окно $_id')),
//       body: Center(
//           child: RaisedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Назад'))),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     initialRoute: '/',
//     routes: {
//       '/': (BuildContext context) => MainScreen(),
//       '/second': (BuildContext context) => SecondScreen()
//     },
//     onGenerateRoute: (routeSettings) {
//       var path = routeSettings.name.split('/');
//       if (path[1] == "second") {
//         return new MaterialPageRoute(
//           builder: (context) => new SecondScreen(id: path[2]),
//           settings: routeSettings,
//         );
//       }
//     },
//   ));
// }

// enum GenderList { male, female }

// class MyForm extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => MyFormState();
// }

// class MyFormState extends State {
//   final _formKey = GlobalKey<FormState>();
//   GenderList _gender;
//   bool _agreement = false;
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.all(10.0),
//         child: new Form(
//             key: _formKey,
//             child: new Column(
//               children: <Widget>[
//                 new Text(
//                   'І"мя користувача: ',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 new TextFormField(validator: (value) {
//                   if (value.isEmpty) return 'Будь ласка, введіть своє ім"я';
//                 }),
//                 new SizedBox(height: 20.0),
//                 new Text(
//                   'Контактний E-mail:',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 new TextFormField(validator: (value) {
//                   if (value.isEmpty) return 'Будь ласка, введіть свій Email';
//                   String p =
//                       "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
//                   RegExp regExp = new RegExp(p);
//                   if (regExp.hasMatch(value)) return null;
//                   return 'Це не E-mail';
//                 }),
//                 new SizedBox(height: 20.0),
//                 new Text(
//                   'Ваша стать:',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 new RadioListTile(
//                   title: const Text('Чоловіча'),
//                   value: GenderList.male,
//                   groupValue: _gender,
//                   onChanged: (GenderList value) {
//                     setState(() {
//                       _gender = value;
//                     });
//                   },
//                 ),
//                 new RadioListTile(
//                   title: const Text('Жіноча'),
//                   value: GenderList.female,
//                   groupValue: _gender,
//                   onChanged: (GenderList value) {
//                     setState(() {
//                       _gender = value;
//                     });
//                   },
//                 ),
//                 new SizedBox(height: 20.0),
//                 new CheckboxListTile(
//                     value: _agreement,
//                     title: new Text('Я ознайомлений' +
//                         (_gender == null
//                             ? '(а)'
//                             : _gender == GenderList.male ? '' : 'а') +
//                         ' з документом  "Згода на обробку персональних даних" і даю згоду на обробку моїх персональних даних. '),
//                     onChanged: (bool value) =>
//                         setState(() => _agreement = value)),
//                 new SizedBox(height: 20.0),
//                 new RaisedButton(
//                   onPressed: () {
//                     if (_formKey.currentState.validate()) {
//                       Color color = Colors.red;
//                       String text;
//                       if (_gender == null)
//                         text = 'Виберіть вашу стать';
//                       else if (_agreement == false)
//                         text = 'Необхідно прийняти умови згоди';
//                       else {
//                         text = 'Форма успішно заповнена';
//                         color = Colors.green;
//                       }
//                       Scaffold.of(context).showSnackBar(SnackBar(
//                         content: Text(text),
//                         backgroundColor: color,
//                       ));
//                     }
//                   },
//                   child: Text('Перевірити'),
//                   color: Colors.blue,
//                   textColor: Colors.white,
//                 ),
//               ],
//             )));
//   }
// }

// void main() => runApp(new MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: new Scaffold(
//         appBar: new AppBar(title: new Text('Тестове завдання - Форма ввода')),
//         body: new MyForm())));

// class MyBody extends StatefulWidget {
//   @override
//   createState() => new MyBodyState();
// }

// class MyBodyState extends State<MyBody> {
//   List<String> _array = [];
//   @override
//   Widget build(BuildContext context) {
//     return new ListView.builder(itemBuilder: (context, i) {
//       print('num $i : нечетное = ${i.isOdd}');
//       if (i.isOdd) return new Divider();
//       final int index = i ~/ 2;
//       print('index $index');
//       print('length ${_array.length}');
//       if (index >= _array.length)
//         _array.addAll(['$index', '${index + 1}', '${index + 2}']);
//       return new ListTile(title: new Text(_array[index]));
//     });
//   }
// }

// void main() => runApp(new MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: new Scaffold(
//         body: new Center(
//       child: new MyBody(),
//     ))));

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(

//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(home: MyPage()));
// }

// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => new _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   final Random _random = Random();

//   Color _color = Color(0xFFFFFFFF);

//   void changeColor() {
//     setState(() {
//       _color = Color.fromARGB(
//         _random.nextInt(256),
//         _random.nextInt(256),
//         _random.nextInt(256),
//         _random.nextInt(256),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Example excercise',
//         ),
//         backgroundColor: Colors.amber,
//       ),
//       body: InkWell(
//         onTap: changeColor,
//         child: Container(
//             color: _color,
//             child: Container(
//               child: Text(
//                 'Hey there',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 50, color: Colors.black45),
//               ),
//               height: 820,
//               width: 500,
//             )),
//       ),
//     );
//   }
// }

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
