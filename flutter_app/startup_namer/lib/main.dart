import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'second.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup',
      theme: new ThemeData(
        primaryColor: Colors.red,
      ),
      routes: {
        "secondpage":(context)=> MyScaffold()
      },
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggetions(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _jumpRoute,
          icon: Icon(Icons.add),
          backgroundColor: Colors.red,
          label: Text('Jump')
      )
    );
  }

  Widget _buildSuggetions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每一个建议的单词都会调用一次itemBuilder，然后将单词添加到ListTile行中
        // 在偶数行，改函数会为单词对添加一个ListTile row
        // 在奇数行，改函数会添加一个分割线widget，来分割相邻的次对。
        itemBuilder: (context, i) {
          // 在每一列钱添加一个1px高的分割线widget
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // 接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(index, _suggestions[index]);
        });
  }

  Widget _buildRow(int index, WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        index.toString() + " " + pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          // 在Flutter的响应式风格的框架中，调用setState()会为State对象触发build()方法，从而导致对UI的更新
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  /// 跳转到收藏页
  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();

      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Saved Suggestions'),
        ),
        body: new ListView(children: divided),
      );
    }));
  }

  /// 跳转到另一页
  void _jumpRoute() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context){
          return MyScaffold();
        }));
  }
}


class NewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Route'),
      ),
      body: Center(
        child: Text('This is new route'),
      ),
    );
  }

}