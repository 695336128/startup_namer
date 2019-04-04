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
          ImageTestWidget(),
          SwitchAndCheckBoxTestRoute(),
          TextTestWidget(),
          ButtonTestWidget(),
          TextFieldTestWidget(),
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

class ImageTestWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image(
          width: 100,
          height: 100,
          image: AssetImage('assets/images/checkcircle.png'),
        ),
        Image.network(
          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
        Text(
          "\uE914",
          style: TextStyle(
              fontFamily: "MaterialIcons",
              fontSize: 24.0,
              color: Colors.red
          ),
        ),
        Icon(Icons.accessible,color: Colors.red,)
      ],
    );
  }

}


class TextTestWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Hello World",
          textAlign: TextAlign.center,
        ),
        Text("Hello World" * 8,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.red,
              fontStyle: FontStyle.italic
          ),
        ),
        Text.rich(
            TextSpan(
                children: [
                  TextSpan(
                      text: "Home: "
                  ),
                  TextSpan(
                      text: "http://flutterchina.club",
                      style: TextStyle(
                          color: Colors.blue
                      )
                  )
                ]
            )
        ),

      ],
    );
  }

}

class SwitchAndCheckBoxTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute>{
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Switch(
          value: _switchSelected,
          onChanged: (value){
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red,
          onChanged: (value){
            setState(() {
              _checkboxSelected = value;
            });
          },

        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red,
          onChanged: (value){
            setState(() {
              _checkboxSelected = value;
            });
          },

        )
      ],
    );
  }

}

class ButtonTestWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("RaisedButton"),
          onPressed: ()=>{},
        ),
        FlatButton(
          child: Text("FlatButton"),
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: ()=>{},
        ),
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: ()=>{},
        ),
        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: ()=>{},
        )
      ],
    );
  }

}

class TextFieldTestWidget extends StatelessWidget{

  /// 定义一个controller
  TextEditingController _unameController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    _unameController.addListener(()=>{
      print(_unameController.text)
    });
    return Column(
      children: <Widget>[
        TextField(
          controller: _unameController,
          decoration: InputDecoration(
            labelText: "用户名",
            hintText: "用户名或邮箱",
            prefixIcon: Icon(Icons.person)
          ),
          onChanged: (v){
            print("onChange:$v");
          },
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "密码",
            hintText: "您的登录密码",
            prefixIcon: Icon(Icons.lock)
          ),
          obscureText: true,
        )
      ],
    );
  }

}


