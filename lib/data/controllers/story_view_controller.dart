import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/story_model.dart';
import '../services/story_service.dart';


class StoryViewController extends GetxController {
  var stories = <Story>[].obs;
  var currentIndex = 0.obs;
  var isLoading = true.obs;
  late PageController pageController;
  Timer? autoPlayTimer;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentIndex.value);
    fetchStories();
  }

  void fetchStories() async {
    try {
      isLoading(true);
      var storyData = await StoryService().fetchStories();
      stories.assignAll(storyData);
      // _startAutoPlay();
    } finally {
      isLoading(false);
    }
  }

  void startAutoPlay() {
    autoPlayTimer?.cancel(); // Cancel any existing timer
    autoPlayTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      nextStory();
    });
  }

  void nextStory() {
    if (currentIndex.value < stories.length - 1) {
      currentIndex++;
      pageController.animateToPage(
        currentIndex.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      resetAutoPlay();
    } else {
      Get.back();  // Close viewer if at the last story
    }
  }

  void previousStory() {
    if (currentIndex.value > 0) {
      currentIndex--;
      pageController.animateToPage(
        currentIndex.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    resetAutoPlay();
  }

  void resetAutoPlay() {
    startAutoPlay();
  }

  @override
  void onClose() {
    autoPlayTimer?.cancel();
    super.onClose();
  }
}
