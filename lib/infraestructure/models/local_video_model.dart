import 'package:reelstok/domain/entities/videos_post.dart';

class LocalVideoModel{
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0
  });

  factory LocalVideoModel.fromJason(Map<String, dynamic>json) => LocalVideoModel(
    name: json['name'] ?? 'No hay video.',
     videoUrl: json['videoUrl'],
     likes: json['likes'] ?? 0,
     views: json['views'] ?? 0
     );

  VideoPost toVideoPostEntity() => VideoPost(
    caption: name, 
    videoUrl: videoUrl,
    likes: likes,
    views: views
    );
}