import 'package:flutter/material.dart';
import 'package:startup_namer/second.dart';
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
        "secondPage": (context) => MyScaffold()
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
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  "Base Widget Page",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: () => {_jumpSecondPage(context)},
              ),
            )
          ],
        ),
      ),
    );
  }

  _jumpMainPage(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return MyApp();
    }));
  }

  _jumpSecondPage(BuildContext context) {
    Navigator.pushNamed(context, "secondPage");
  }
}
