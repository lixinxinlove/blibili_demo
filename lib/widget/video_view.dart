import 'dart:ffi';
import 'dart:html';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

///  视频播放view
class VideoView extends StatefulWidget {
  final String url;
  final String cover;
  final bool autoPlay;
  final bool looping;
  final double aspectARatio;

  const VideoView({
    super.key,
    required this.url,
    required this.cover,
    required this.autoPlay,
    required this.looping,
    required this.aspectARatio,
  });

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url));
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: widget.aspectARatio,
        looping: widget.looping,
        autoPlay: widget.autoPlay);
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double playHeight = screenWidth / widget.aspectARatio;
    return Container(
      width: screenWidth,
      height: playHeight,
      color: Colors.grey,
      child: Chewie(controller: _chewieController),

    );
  }
}
