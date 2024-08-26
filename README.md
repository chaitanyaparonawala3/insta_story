# Instagram Stories Feature

This is a simplified implementation of the Instagram Stories feature using Flutter.
It showcases the ability to fetch stories from a remote API using the Dio package, 
display them in a horizontal list, and allow users to navigate through stories manually or automatically.

## Feature

- Fetches stories from a remote API.
- Displays stories in a horizontally scrollable list.
- Allows users to manually navigate between stories.
- Automatically advances to the next story every 5 seconds.
- Loops back to the first story after the last one.
- Uses GetX for state management.

## Setup Instructions

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Start the app using `flutter run`.

## Project Structure

- lib/: Contains the main application code.
    - main.dart: The entry point of the application.
    - story_controller.dart: The GetX controller for managing story state.
    - story_service.dart: The service for fetching stories from the API.
    - story_list.dart: The widget displaying the list of stories.
    - story_view_screen.dart: The widget displaying the currently selected story.
    - story_model.dart: The model representing a story.

## API Used

- This project uses the Fake Store API to fetch stories data. ("https://fakestoreapi.com/products")

## Running Tests

- This project includes integration tests to ensure that the app's core functionality works as expected.
- Use the following command to run the integration tests:
  `flutter drive --driver=test_driver/integration_test.dart --target=test_driver/app_test.dart`



