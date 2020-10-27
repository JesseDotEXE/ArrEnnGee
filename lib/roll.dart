import 'package:flutter/material.dart';

class Roll extends StatefulWidget {
  String sides;
  String result;
  Color color;

  Roll({ this.sides, this.result, this.color });

  @override
  RollState createState() => RollState( sides: this.sides, result: this.result, color: this.color );
}

class RollState extends State<Roll> with TickerProviderStateMixin {
  String sides;
  String result;
  Color color;
  AnimationController _controller;
  Animation<double> _animation;

  RollState({ this.sides, this.result, this.color });

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage('lib/assets/d$sides.png'),
              color: color,
              width: 128,
              height: 128,
            ),
          ),
          Text(
              result.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontSize: 28.0,
              )
          ),
        ],
      )
    );
  }
}