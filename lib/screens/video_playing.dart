import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlaying extends StatefulWidget {
  final String videoId;

  const VideoPlaying({Key key, this.videoId}) : super(key: key);
  @override
  _VideoPlayingState createState() => _VideoPlayingState(videoId);
}

class _VideoPlayingState extends State<VideoPlaying> {
  YoutubePlayerController _controller;
  final String videoId;

  _VideoPlayingState(this.videoId);

  @override
  void initState() {
    print("videoUrl: $videoId");
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: "$videoId",
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

//OtkrNQxJzBQ - mtechviral
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text("title")),
        body: YoutubePlayer(controller: _controller),
      ),
    );
  }
}
