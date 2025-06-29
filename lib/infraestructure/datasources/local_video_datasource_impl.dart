import 'package:reelstok/domain/datasources/video_post_datasource.dart';
import 'package:reelstok/domain/entities/videos_post.dart';
import 'package:reelstok/infraestructure/models/local_video_model.dart';
import 'package:reelstok/shared/data/local_video_posts.dart';

class LocalVideoDataSourceImpl implements VideoPostDatasource{
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    // TODO: implement getTrendingVideosByPage
    // throw UnimplementedError();
    await Future.delayed(const Duration(seconds: 2));

      final List<VideoPost> newVideos = videoPost.map(
        (video) => LocalVideoModel.fromJason(video).toVideoPostEntity()).toList();

        return newVideos;
  }

}