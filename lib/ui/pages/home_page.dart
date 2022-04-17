import 'package:flutter/material.dart';
import '../../entity/data.dart';
import '../../main.dart';
import '../widgets/Page1.dart';
import '../widgets/Page2.dart';
import '../widgets/Page3.dart';
import '../widgets/Page4.dart';
import '../widgets/animal_kinds_tab_bar.dart';
import '../widgets/custom_sliver_app_bar.dart';
import '../widgets/video_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getASync();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          new SliverFillRemaining(
              child: AnimalKindsTabBar("ねこ", Page1())
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 60.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final video = videos[index];
                  return VideoCard(video: video);
                },
                childCount: videos.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
