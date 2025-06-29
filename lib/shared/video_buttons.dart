import 'package:reelstok/config/helpers/human_formats.dart';
import 'package:reelstok/domain/entities/videos_post.dart';
import 'package:flutter/material.dart';

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;
  // Será un botón personalizado
  // El super.key en un elemento privado no es necesario
  const _CustomIconButton({
    required this.value,
    required this.iconData,
    // El color pasará a ser condicional
    iconColor
  }): color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      IconButton(onPressed: () {},
      icon: Icon(iconData, color: color, size: 30)),
      //Text('$value'),
      Text(HumanFormats.humanReadableNumber(value.toDouble())),
      ],
    );
  }
}
class VideoButtons extends StatelessWidget {
  // Recibir
  final VideoPost video;
  // Botones del video
  const VideoButtons({
    super.key,
    required this.video
  });

@override
Widget build(BuildContext context) {
  return Column(
    children: [
      // IconButton(onPressed: () {}, icon: Icon(Icons.favorite, color:Colors.red)),
      _CustomIconButton(value: video.likes, iconData: Icons.favorite, iconColor: Colors.red),
      _CustomIconButton(value: video.views, iconData: Icons.remove_red_eye_outlined)
    ],
  );
}
}