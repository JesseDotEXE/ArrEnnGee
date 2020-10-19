import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dice_roller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DiceRoller roller = new DiceRoller();
  int currentDie = 4;
  Color currentColor = Colors.white;
  int result = 0;

  void rollDice(int size, Color color) {
    setState(() {
      currentDie = size;
      currentColor = color;
      result = roller.roll(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage('lib/assets/d$currentDie.png'),
                    color: currentColor,
                    width: 256,
                    height: 256,
                  ),
                ),
                Text(
                    result.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 56.0,
                    )
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () { rollDice(4, Colors.yellow); },
                        color: Colors.yellow,
                        child: Text('d4')
                    ),
                    FlatButton(
                        onPressed: () { rollDice(6, Colors.red); },
                        color: Colors.red,
                        child: Text('d6')
                    ),
                    FlatButton(
                        onPressed: () { rollDice(8, Colors.orange); },
                        color: Colors.orange,
                        child: Text('d8')
                    ),
                    FlatButton(
                        onPressed: () { rollDice(10, Colors.blue); },
                        color: Colors.blue,
                        child: Text('d10')
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () { rollDice(12, Colors.green); },
                        color: Colors.green,
                        child: Text('d12')
                    ),
                    FlatButton(
                        onPressed: () { rollDice(20, Colors.purple); },
                        color: Colors.purple,
                        child: Text('d20')
                    ),
                    FlatButton(
                        onPressed: () { rollDice(100, Colors.grey); },
                        color: Colors.grey,
                        child: Text('d100')
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
