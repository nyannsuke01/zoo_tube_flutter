import 'package:flutter/material.dart';
import '../../entity/data.dart';
import '../../main.dart';
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
