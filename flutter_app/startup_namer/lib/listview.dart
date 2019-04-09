import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class listviewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: InfiniteListView(),
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView.separated(
        itemCount: _words.length,
        itemBuilder: (context, index) {
          // 如果到了表尾
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              // 获取数据
              _retrieveData();
              // 加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                  ),
                ),
              );
            } else {
              // 已经加载100条数据了 不再获取新数据
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "No more data",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }
          return ListTile(
            title: Text("这是第 $index 项"),
            subtitle: Text("APPLE"),
            leading: Icon(
              Icons.flight_takeoff,
              color: Colors.redAccent,
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.orangeAccent,
            ),
          );
        },
        separatorBuilder: (context, index) =>
            Divider(
              color: Colors.blue,
              height: .0,
            ),
      ),
      onRefresh:_handleRefresh,
      color: Colors.redAccent,
    );
  }

  _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          // 每次生成20个数据
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //　重新构建列表
      });
    });
  }

  Future<void> _handleRefresh() {
    return Future.delayed(Duration(seconds: 2)).then((e) {
      _words.clear();
      _words.add(loadingTag);
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(5).map((e) => e.asPascalCase).toList());
      setState(() {

      });
    });
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(
      color: Colors.greenAccent,
    );

    return ListView.separated(
      itemCount: 100,
      // 列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("这是第 $index 项"),
          subtitle: Text("APPLE"),
          leading: Icon(
            Icons.flight_takeoff,
            color: Colors.redAccent,
          ),
          trailing: Icon(
            Icons.favorite,
            color: Colors.orangeAccent,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }
}
