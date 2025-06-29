import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reelstok/infraestructure/datasources/local_video_datasource_impl.dart';
import 'package:reelstok/infraestructure/repositories/video_repository_impl.dart';
import 'package:reelstok/presentation/providers/discover_provider.dart';
import 'package:reelstok/presentation/screens/discover/discover_screen.dart';
import 'config/theme/app_theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final VideoPostRepository = VideoPostRepositoryImpl(
      videosDatasource: LocalVideoDataSourceImpl()
      );

    return MultiProvider(
      providers: [ChangeNotifierProvider(
        // esta opción obliga a ejecutarlo aunque no sea necesario
        lazy: false,
        create: (_)=> DiscoverProvider(videosRepository: VideoPostRepository)..loadNextPage()),
      ],
      child: MaterialApp(
      title: 'ReelsTok',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const DiscoverScreen(),
      ),
    );
  }
}


