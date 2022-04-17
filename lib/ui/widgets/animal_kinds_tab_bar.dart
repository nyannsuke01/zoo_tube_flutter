import 'package:flutter/material.dart';
import 'package:zoo_tube_flutter/ui/widgets/Page1.dart';
import 'package:zoo_tube_flutter/ui/widgets/page2.dart';
import 'package:zoo_tube_flutter/ui/widgets/page3.dart';
import 'package:zoo_tube_flutter/ui/widgets/page4.dart';

class AnimalKindsTabBar extends StatelessWidget {
  String name;
  Widget widget;
  AnimalKindsTabBar(this.name, this.widget);
  @override
  Widget build(BuildContext context) {
    
    final List<AnimalKindsTabBar> _tabs = [
      AnimalKindsTabBar("ねこ",Page1()),
      AnimalKindsTabBar("いぬ",Page2()),
      AnimalKindsTabBar("うさぎ",Page3()),
      AnimalKindsTabBar("ライオン",Page4()),
    ];
    return DefaultTabController(
      length: _tabs.length,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
          isScrollable: true,
          tabs: _tabs.map((AnimalKindsTabBar tab){
            return Tab(text: tab.name);
          }).toList(),
        ),],
      ),
      // child: TabBar(
      //   isScrollable: true,
      //   tabs: _tabs.map((AnimalKindsTabBar tab){
      //     return Tab(text: tab.name);
      //   }).toList(),
      // ),
    );
  }
}
