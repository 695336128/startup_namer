import 'package:flutter/material.dart';

class SingleChildScrollViewPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIGKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Child ScrollView"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              // 动态创建一个List<Widget>
              children: str.split("").map((c)=>Text(c,textScaleFactor: 2.0,)).toList(),
            ),
          ),
        ),
      ),
    );
  }

}