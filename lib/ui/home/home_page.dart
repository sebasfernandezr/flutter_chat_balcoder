import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(child:Text("CONTACTS")),
            Tab(child:Text("CHATS")),
          ],
        ),
        title: Text("Home"),
      ),
      body: Center(
          child: TabBarView(
        children: [
          Container(
            color: Colors.green,
          ),
          Container(color: Colors.blue)
        ],
        controller: _tabController,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
