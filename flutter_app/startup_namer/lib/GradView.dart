import 'package:flutter/material.dart';

class gradviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grad View"),
      ),
      body: MyGridViewBuild(),
    );
  }
}

/// 横轴固定数量子元素
class MyGridViewCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // 横轴三个子widget
      childAspectRatio: 1.0, // 子widget宽高比为1
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
        Icon(Icons.fastfood),
      ],
    );
  }
}
/// 横轴子元素为固定长度的layout算法
class MyGridViewExtent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 100.0,
      childAspectRatio: 2.0,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
        Icon(Icons.fastfood),
      ],
    );
  }

}

class MyGridViewBuild extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyGridViewBuildState();
}

class _MyGridViewBuildState extends State<MyGridViewBuild>{

  List<IconData> _icons = []; // 保存Icon数据

  @override
  void initState() {
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 每行三列
          childAspectRatio: 1.0
        ),
        itemCount: _icons.length,
        itemBuilder: (context,index){
          // 如果显示到最后一个并且Icon总数小于200时继续获取数据
          if(index == _icons.length - 1 && _icons.length < 200){
            _retrieveIcons();
          }
          return Icon(_icons[index],color: Colors.redAccent,);
        }
    );
  }

  // 模拟异步获取数据
  void _retrieveIcons(){
    Future.delayed(Duration(milliseconds: 200)).then((e){
      setState(() {
        _icons.addAll([
            Icons.ac_unit,
            Icons.airport_shuttle,
            Icons.all_inclusive,
            Icons.beach_access,
            Icons.cake,
            Icons.free_breakfast
        ]);
      });
    });
  }


}