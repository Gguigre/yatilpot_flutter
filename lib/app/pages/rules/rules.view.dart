import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Rules extends StatelessWidget {
  const Rules({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: '_0ilJQffyMI',
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );

    return Container(
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        onReady: () {
          print("player ready..");
        },
      ),
    );
  }
}
