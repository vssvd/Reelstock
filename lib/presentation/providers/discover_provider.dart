import 'package:flutter/material.dart';
import 'package:reelstok/domain/Repositories/video_post_repository.dart';
import 'package:reelstok/domain/entities/videos_post.dart';

class DiscoverProvider extends ChangeNotifier{

  final VideoPostRepository videosRepository;
  //Variable que será útil para una carga inicial de videos
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videosRepository
  });

  Future<void> loadNextPage() async{
    // Espera de 2 segundos para que cargue el video
    await Future.delayed(const Duration(seconds: 2));
    //Listado de videos
    // ignore: prefer_typing_uninitialized_variables
    
   // final List<VideoPost> newVideos = videoPost.map(
     // (video) => LocalVideoModel.fromJason(video).toVideoPostEntity()).toList();
      // Alternativa
      // final List<VideoPost> newVideos = videoPosts.map(
      // (video) => VideoPost(
      // caption: video['name'],
      // videoUrl: video['videoUrl'],
      // likes: video['likes],
      // views: video['views]
      // )
      // ).toList();

      final newVideos = await videosRepository.getTrendingVideosByPage(1);

    //Cargar videos
    videos.addAll(newVideos);
    // Ya fueron cargados los videos
    initialLoading = false;
    notifyListeners();
  }
}