import 'package:flutter/material.dart';
import '../widgets/list_wigget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (
                BuildContext context,
                bool innerBoxIsScrolled,
                ) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context,
                  ),
                  sliver: SliverAppBar(
                    leading: Icon(Icons.menu),
                    title: const Text('ZooTube'),
                    backgroundColor: Colors.orange,
                    centerTitle: true,
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.settings,
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
                        Tab(text: "Cat1"),
                        Tab(text: "Dog"),
                        Tab(text: "Rabbit")
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[ListWidget('Cat'), ListWidget('Dog'), ListWidget('Rabbit')],
            ),
          ),
        ),
      ),
    );
  }
}
