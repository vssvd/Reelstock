import 'package:flutter/material.dart';
import 'package:reelstok/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _VideoCaption extends StatelessWidget {

  final String caption;

  const _VideoCaption({
    required this.caption
  });
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width *0.6,
      child: Text( caption, maxLines: 2, style: titleStyle),
    );
  }
  
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  // Documentación de Flutter video_player (Cookbook)
  late VideoPlayerController controller;

  @override
  void initState(){
    super.initState();
    // Controlador para el video
    controller = VideoPlayerController.asset(widget.videoUrl)
    ..setVolume(0)
    ..setLooping(true)
    ..play();
  }

  @override
  void dispose() {
    //Evitar que se siga reproduciendo y que se agote la memoria
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot){
        // Si no se ha cargado el video estará girando el indicador
        if (snapshot.connectionState != ConnectionState.done){
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        }
        // Retornará el video
        return GestureDetector(
          onTap: (){
            if (controller.value.isPlaying){
              controller.pause();
              return;
            }
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),

                VideoBackground(
                  stops: const [0.8, 1.0],
                ),

                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption)
                ),
              ],
            ),
          ),
        ); 
      }
    );
  }
}