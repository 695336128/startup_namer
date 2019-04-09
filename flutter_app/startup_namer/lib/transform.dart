import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Transform Page"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(50.0),
            color: Colors.black,
            child: Transform(
              alignment: Alignment.topRight,
              transform: Matrix4.skewY(0.3), // 沿Y轴倾斜0.3弧度
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text("Transform Transform"),
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            // 默认远点为左上角，左移20像素，上相平移5像素
            child: Transform.translate(
              offset: Offset(-20.0, -5.0),
              child: Text("Hello World"),
            ),
          ),
          Container(
            margin: EdgeInsets.all(50.0),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                angle: math.pi / 2,
                child: Text("Hello World"),
              ),
            ),
          ),
          Container(
            color: Colors.red[300],
            margin: EdgeInsets.all(50.0),
            child: Transform.scale(
              scale: 1.5,
              child: Text("Hello World"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.deepOrange
                ),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text("Hello World"),
                ),
              ),
              Text("你好",style: TextStyle(
                color: Colors.green,
                fontSize: 18.0,
              ),)
            ],
          )
        ],
      ),
    );
  }
}
