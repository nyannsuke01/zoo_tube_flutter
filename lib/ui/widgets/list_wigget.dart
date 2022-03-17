import 'package:flutter/material.dart';
import 'package:zoo_tube_flutter/ui/pages/home_page.dart';

class ListWidget extends StatelessWidget {
  final String name;

  ListWidget(this.name);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>(name),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverFixedExtentList(
                  itemExtent: 48.0,
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                    childCount: 30,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}