import 'package:reelstok/domain/Repositories/video_post_repository.dart';
import 'package:reelstok/domain/datasources/video_post_datasource.dart';
import 'package:reelstok/domain/entities/videos_post.dart';


class VideoPostRepositoryImpl implements VideoPostRepository {

  final VideoPostDatasource videosDatasource;

  VideoPostRepositoryImpl({
    required this.videosDatasource
  });

  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    // TODO: implement getTrendingVideosByPage
    //throw UnimplementedError();
    return videosDatasource.getTrendingVideosByPage(page);
  }
}