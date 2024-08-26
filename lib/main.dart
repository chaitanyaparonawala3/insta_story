import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/data/controllers/story_view_controller.dart';
import 'package:insta_demo/ui/widgets/story_list.dart';


void main() {
  runApp(StoryApp());
}

class StoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: StoryHomePage(),
      initialBinding: BindingsBuilder(() {
        Get.put(StoryViewController());
      }),
    );
  }
}

class StoryHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Instagram Stories')),
      body: StoryList(),
    );
  }
}
