import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: const Text('ZooTube'),
          backgroundColor: Colors.orange,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.face,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: "Test"),
              Tab(text: "Dog2"),
              Tab(text: "Rabbit")
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's Cat Page"),
            ),
            Center(
              child: Text("It's Dog Page"),
            ),
            Center(
              child: Text("It's Rabbit"),
            ),
          ],
        ),
      ),
    );
  }
}
