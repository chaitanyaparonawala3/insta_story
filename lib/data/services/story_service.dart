import 'package:dio/dio.dart';
import '../models/story_model.dart';

class StoryService {
  final Dio _dio = Dio();

  Future<List<Story>> fetchStories() async {
    try {
      Response response = await _dio.get('https://fakestoreapi.com/products');
      List<dynamic> data = response.data;
      return data.map((json) => Story.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load stories');
    }
  }
}
