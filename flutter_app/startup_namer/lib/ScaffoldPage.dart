import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaffoldRouteState();
  }
}

class _ScaffoldRouteState extends State<StatefulWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController; // 需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    // 创建controler
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 导航栏
        title: Text("App Name"),
//        leading: Builder(
//          builder: (context) {
//            return IconButton(
//              icon: Icon(
//                Icons.menu,
//                color: Colors.white,
//              ),
//              onPressed: () {},
//            );
//          },
//        ),
        bottom: TabBar(
          // 生成Tab菜单
          controller: _tabController,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
        actions: <Widget>[
          // 导航栏右侧菜单
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => {},
          ),
        ],
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.business),title: Text("Business")),
          BottomNavigationBarItem(icon: Icon(Icons.school),title: Text("School")),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _inAdd,
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 5,
            ),
          );
        }).toList(),
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  void _inAdd(){

  }

}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ClipOval(
                      child:  Image(
                        width: 80,
                        height: 80,
                        image: AssetImage('assets/images/userimg.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      "Zhang",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text("Add account"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Manager account"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
