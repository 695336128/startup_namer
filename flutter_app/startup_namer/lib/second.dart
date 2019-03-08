import 'package:flutter/material.dart';


class SeconPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Second Page",
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home: MyScaffold(),
    );
  }

}

class MyAppBar extends StatelessWidget{
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 72.0, // 单位是逻辑上的像素
      padding: const EdgeInsets.only(left: 8.0,top: 16.0,right: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向上的线性布局
      child: new Row(
        // 列表项的内容是<widget>
        children: <Widget>[
          new IconButton(
              icon: new Icon(
                  Icons.arrow_back,
                  color: Colors.white
              ),
              tooltip: 'Navigation menu',
              onPressed: (){Navigator.pop(context);} // null 会禁用button
          ),
          new Expanded(
            child: title
          ),
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // Material 是UI程序呈现的“一张纸”
    return new Scaffold(
      // Column is 垂直方向上的线性布局
//      appBar: AppBar(
//        title: Text('Second Page'),
//      ),
      body: Column(
        children: <Widget>[
          MyAppBar(
              title: Text(
                'Example title',
                style: Theme
                    .of(context)
                    .primaryTextTheme
                    .title,
              )
          ),
          Expanded(
            child: Center(
              child: Text(
                  'Hello,World'
              ),
            ),
          )
        ],
      ),
    );
  }
}


