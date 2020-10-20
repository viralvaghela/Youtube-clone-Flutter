import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlaying extends StatefulWidget {
  final String videoId;

  final String thumbnail;
  final String title;
  final String channelProfilePicUrl;
  final String channelName;
  final String viewCount;
  final String uploadTime;
  final String videoUrl;
  const VideoPlaying(
      {Key key,
      this.videoId,
      this.thumbnail,
      this.title,
      this.channelProfilePicUrl,
      this.channelName,
      this.viewCount,
      this.uploadTime,
      this.videoUrl})
      : super(key: key);
  @override
  _VideoPlayingState createState() => _VideoPlayingState(
      this.videoId,
      this.thumbnail,
      this.title,
      this.channelProfilePicUrl,
      this.channelName,
      this.viewCount,
      this.uploadTime,
      this.videoUrl);
}

class _VideoPlayingState extends State<VideoPlaying> {
  YoutubePlayerController _controller;
  final String videoId;
  final String thumbnail;
  final String title;
  final String channelProfilePicUrl;
  final String channelName;
  final String viewCount;
  final String uploadTime;
  final String videoUrl;

  _VideoPlayingState(
      this.videoId,
      this.thumbnail,
      this.title,
      this.channelProfilePicUrl,
      this.channelName,
      this.viewCount,
      this.uploadTime,
      this.videoUrl);

  @override
  void initState() {
    print("videoUrl: $videoId");
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: "$videoId",
      flags: const YoutubePlayerFlags(
        mute: true,
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
        body: Column(
          children: [
            YoutubePlayer(controller: _controller),
            // ListTile(
            //   title: Text(
            //     "title",
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            //   leading: CircleAvatar(
            //     maxRadius: 20,
            //     backgroundImage: NetworkImage('channelProfilePicUrl'),
            //   ),
            //   subtitle: Text("channelName - viewCount - uploadTime"),
            //   trailing: IconButton(
            //     icon: Icon(Icons.more_vert),
            //     onPressed: () {},
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
