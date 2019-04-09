import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';


class WrapScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap Page"),
      ),
      body: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: 4.0, // 纵轴(垂直)方向间距
        alignment: WrapAlignment.center, // 沿主轴方向居中
        children: <Widget>[
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("A")),
            label: new Text(WordPair.random().asPascalCase),
          ),
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("M")),
            label: new Text(WordPair.random().asPascalCase),
          ),
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("H")),
            label: new Text(WordPair.random().asPascalCase),
          ),
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("J")),
            label: new Text(WordPair.random().asPascalCase),
          )
        ],
      ),
    );
  }

}