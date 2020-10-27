import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'roll.dart';

void main() => runApp(ArrEnnGeeApp());

class ArrEnnGeeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArrEnnGee(title: 'Arr Enn Gee'),
    );
  }
}

class ArrEnnGee extends StatefulWidget {
  ArrEnnGee({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ArrEnnGeeState createState() => _ArrEnnGeeState();
}

class _ArrEnnGeeState extends State<ArrEnnGee> {
  List<Roll> rollHistory = [];
  int currentDie;
  Color currentColor;
  int gridColumns;
  bool keyHack = false;

  @override
  void initState() {
    super.initState();

    rollHistory = [];
    currentDie = 4;
    currentColor = Colors.white;
    gridColumns = 1;
    keyHack = false;
  }

  void rollDice(int sides, Color color) {
    setState(() {
      currentDie = sides;
      currentColor = color;

      if (this.rollHistory.length >= 12) {
        this.keyHack = !this.keyHack;
        this.rollHistory.clear();
      }

      Roll newRoll = new Roll(sides: sides.toString(), result:  (Random().nextInt(sides) + 1).toString(), color: color);
      this.rollHistory.add(newRoll);

      if (this.rollHistory.length > 1) {
        this.gridColumns = (this.rollHistory.length / 6).ceil() + 1;
      } else {
        this.gridColumns = 1;
      }
    });
  }

  void clearHistory() {
    setState(() {
      this.rollHistory.clear();
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
          children: <Widget> [
            Expanded(
              child: GridView.count(
                key: Key(this.keyHack.toString()), // List.clear() doesn't seem to trigger the re-render so I had to make a little hack that would for a re-draw of the whole list.
                padding: EdgeInsets.all(10.0),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                crossAxisCount: this.gridColumns,
                children:  this.rollHistory.toList()
              ),
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
                        onPressed: () { rollDice(100, Colors.blueGrey); },
                        color: Colors.blueGrey,
                        child: Text('d100')
                    ),
                    FlatButton(
                        onPressed: () { clearHistory(); },
                        color: Colors.grey,
                        child: Text('Clear')
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
