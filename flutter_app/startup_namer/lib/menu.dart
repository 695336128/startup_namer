import 'package:flutter/material.dart';
import 'package:startup_namer/ScaffoldPage.dart';
import 'package:startup_namer/flex.dart';
import 'package:startup_namer/second.dart';
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
        "scaffoldPage": (context) => DemoPage(),
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
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.red,Colors.orange[700]]),
                  borderRadius: BorderRadius.circular(3.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0
                    )
                  ]
                ),
                child: FlatButton(
                  child: Text(
                    "Base Widget Page",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.transparent,
                  onPressed: () => {_jumpPage(context, "secondPage")},
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  "Flex Page",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: () => {_jumpPage(context, "flexPage")},
              ),
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
           Container(
             padding: EdgeInsets.only(top: 10.0),
             width: double.infinity,
             child: DecoratedBox(
               decoration: BoxDecoration(
                 gradient: RadialGradient(colors: [Colors.red,Colors.deepOrange]),
                 borderRadius: BorderRadiusDirectional.circular(20.0)
               ),
               child: FlatButton(
                 child: Text(
                   "Transform Page",
                   style: TextStyle(color: Colors.white),
                 ),
                 color: Colors.transparent,
                 onPressed: ()=>{_jumpPage(context, "transformPage")},
               ),
             ),
           ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  "ScaffoldPage",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: () => {_jumpPage(context, "scaffoldPage")},
              ),
            ),
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

  _jumpPage(BuildContext context,String routerName) {
    Navigator.pushNamed(context,routerName);
  }
}
