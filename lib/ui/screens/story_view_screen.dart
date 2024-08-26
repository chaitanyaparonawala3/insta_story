import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/data/controllers/story_view_controller.dart';

class StoryViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StoryViewController controller = Get.find<StoryViewController>();

    return Scaffold(
      key: const Key('story_view'),
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) {
          if (details.globalPosition.dx < MediaQuery.of(context).size.width / 2) {
            controller.previousStory();
          } else {
            controller.nextStory();
          }
        },
        child: Obx(() {
          return PageView.builder(
            controller: controller.pageController,
            onPageChanged: (index) => controller.currentIndex.value = index,
            itemCount: controller.stories.length,
            itemBuilder: (context, index) {
              final story = controller.stories[index];
              return Image.network(
                story.imageUrl,
                // imageUrl: story.imageUrl,
                // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                // errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          );
        }),
      ),
    );
  }
}
