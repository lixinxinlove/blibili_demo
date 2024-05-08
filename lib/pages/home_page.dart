import 'package:blibili_demo/widget/video_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: [
        Text("视频播放器"),
      ],
    );
  }

  _videoView() {
    return VideoView(
        url: "",
        cover: "",
        autoPlay: false,
        looping: false,
        aspectARatio: 16 / 9);
  }
}
