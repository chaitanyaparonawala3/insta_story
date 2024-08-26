import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/data/controllers/story_view_controller.dart';
import '../screens/story_view_screen.dart';

class StoryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final StoryViewController controller = Get.find<StoryViewController>();
    return SizedBox(
      height: 100,
      child: Obx(() {
        if(controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            key: const Key('story_list'),
            scrollDirection: Axis.horizontal,
            itemCount: controller.stories.length,
            itemBuilder: (context, index) {
              final story = controller.stories[index];
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.currentIndex.value = index;
                      Get.to(() => StoryViewer());
                      controller.startAutoPlay();
                    },
                    child: CircleAvatar(
                      key: const Key('story_circle'),
                      radius: 35,
                      backgroundImage: NetworkImage(story.imageUrl),
                    ),
                  ),
                  const SizedBox(width: 10.0,)
                ],
              );
            },
          );
        }
      }),
    );
  }
}
