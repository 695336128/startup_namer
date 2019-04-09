import 'package:flutter/material.dart';
import 'package:startup_namer/GradView.dart';
import 'package:startup_namer/ScaffoldPage.dart';
import 'package:startup_namer/flex.dart';
import 'package:startup_namer/listview.dart';
import 'package:startup_namer/second.dart';
import 'package:startup_namer/singlechildscrollview.dart';
import 'package:startup_namer/transform.dart';
import 'package:startup_namer/wrap.dart';
import 'main.dart';

void main() => runApp(MenuApp());

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My Menu Page",
      theme: ThemeData(primaryColor: Colors.red),
      home: MenuScaffold(),
      routes: {
        "mainPage": (context) => MyApp(),
        "secondPage": (context) => MyScaffold(),
        "flexPage": (context) => FlexPage(),
        "wrapPage": (context) => WrapScaffold(),
        "transformPage": (context) => TransformScaffold(),
        "scaffoldPage": (context) => ScaffoldRoute(),
        "singleChildScrollView": (context) => SingleChildScrollViewPage(),
        "listviewPage": (context) => listviewRoute(),
        "gradviewPage": (context) => gradviewPage(),
      },
    );
  }
}

class MenuScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("导航页面"),
      ),
      body: Container(
        color: Colors.amber,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: RaisedButton(
                  child: Text(
                    "List Page",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                  onPressed: () => {_jumpMainPage(context)},
                ),
              ),
              CustomizeButton(
                routeName: "Base Widget Page",
                onPressed: ()=>{_jumpPage(context, "secondPage")},
              ),
              CustomizeButton(
                routeName: "flexPage",
                onPressed: ()=>{_jumpPage(context, "flexPage")},
              ),
              SizedBox(
                width: double.infinity,
                height: 80.0,
                child: RaisedButton(
                  child: Text(
                    "Wrap Page",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                  onPressed: () => {_jumpPage(context, "wrapPage")},
                ),
              ),
              CustomizeButton(
                routeName: "transformPage",
                onPressed: ()=>{_jumpPage(context, "transformPage")},
              ),
              CustomizeButton(
                routeName: "scaffoldPage",
                onPressed: ()=>{_jumpPage(context, "scaffoldPage")},
              ),
              CustomizeButton(
                routeName: "singleChildScrollView",
                onPressed: ()=>{_jumpPage(context, "singleChildScrollView")},
              ),
              CustomizeButton(
                routeName: "listviewPage",
                onPressed: ()=>{_jumpPage(context, "listviewPage")},
              ),
              CustomizeButton(
                routeName: "gradviewPage",
                onPressed: ()=>{_jumpPage(context, "gradviewPage")},
              ),
            ],
          ),
        ),
      )

    );
  }

  _jumpMainPage(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return MyApp();
    }));
  }

  _jumpPage(BuildContext context,String routerName) {
    Navigator.pushNamed(context,routerName);
  }
}

class CustomizeButton extends StatelessWidget{

  CustomizeButton({Key key,@required this.routeName, @required this.onPressed}) : super(key: key);

  final String routeName;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 2.0),
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red,Colors.orangeAccent]),
            borderRadius: BorderRadius.circular(3.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0
              )
            ]
        ),
        child: FlatButton(
          child: Text(
            routeName,
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.transparent,
          onPressed: onPressed,
        ),
      ),

    );
  }

}
