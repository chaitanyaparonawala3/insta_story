import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:insta_demo/data/controllers/story_view_controller.dart';
import 'package:insta_demo/main.dart';
import 'package:insta_demo/ui/screens/story_view_screen.dart';
import 'package:insta_demo/ui/widgets/story_list.dart';
import 'package:integration_test/integration_test.dart';
import 'package:get/get.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Story App Integration Tests', () {
    testWidgets('Load and display stories', (WidgetTester tester) async {
      await tester.pumpWidget(StoryApp());
      await tester.pumpAndSettle();

      // Verify if the StoryListView is displayed
      expect(find.byKey(const Key('story_list')), findsOneWidget);

      // Wait for the stories to load
      await tester.pump(const Duration(seconds: 2));
      expect(find.byKey(const Key('story_circle')), findsWidgets);

      // Tap the first story
      await tester.tap(find.byKey(const Key('story_circle')).first);
      await tester.pumpAndSettle();

      // Verify if the StoryViewer is displayed
      expect(find.byKey(const Key('story_view')), findsOneWidget);
    });

    testWidgets('Navigate through stories', (WidgetTester tester) async {
      await tester.pumpWidget(StoryApp());
      await tester.pumpAndSettle();

      // Wait for the stories to load
      await tester.pump(Duration(seconds: 2));
      await tester.tap(find.byKey(const Key('story_circle')).first);
      await tester.pumpAndSettle();

      // Tap on the right side to move to the next story
      final screenWidth = tester.binding.window.physicalSize.width;
      await tester.tapAt(Offset(screenWidth * 0.75, 100));
      await tester.pumpAndSettle();

    });

    testWidgets('Auto-play stories', (WidgetTester tester) async {
      await tester.pumpWidget(StoryApp());
      await tester.pumpAndSettle();

      // Wait for the stories to load
      await tester.pump(Duration(seconds: 2));
      await tester.tap(find.byKey(const Key('story_circle')).first);
      await tester.pumpAndSettle();

      // Wait for auto-play to move to the next story
      await tester.pump(Duration(seconds: 5));
      await tester.pumpAndSettle();
    });

    testWidgets('Loop back to the first story', (WidgetTester tester) async {
      await tester.pumpWidget(StoryApp());
      await tester.pumpAndSettle();

      // Wait for the stories to load
      await tester.pump(Duration(seconds: 2));
      await tester.tap(find.byKey(const Key('story_circle')).first);
      await tester.pumpAndSettle();

      final StoryViewController storyController = Get.find<StoryViewController>();
      final lastStoryIndex = storyController.stories.length - 1;

      // Skip to the last story
      storyController.currentIndex.value = lastStoryIndex;
      await tester.pumpAndSettle();

      // Tap on the right side to loop back to the first story
      final screenWidth = tester.binding.window.physicalSize.width;
      await tester.tapAt(Offset(screenWidth * 0.75, 100));
      await tester.pumpAndSettle();

    });
  });
}
