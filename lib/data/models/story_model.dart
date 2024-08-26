class Story {
  final String id;
  final String imageUrl;
  final Duration duration;

  Story({required this.id, required this.imageUrl, required this.duration});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'].toString(),
      imageUrl: json['image'] ?? '', // Assuming 'image' is the key for image URLs
      duration: const Duration(seconds: 5), // Static duration for each story
    );
  }
}
