import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'homepage.dart';
import 'globals.dart';

class YoutubeScreen extends StatefulWidget {
  YoutubeScreen();

  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  final stopwatch = Stopwatch();
  bool completionStatus = false;
  double stopWatchTime = 0;
  var roundedWatchedTime = 0;

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'hKqri_XuIWw',
    flags: YoutubePlayerFlags(
      mute: false,
      autoPlay: false,
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'hKqri_XuIWw',
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    )..addListener(() {
        if (mounted && _controller.value.isPlaying) {
          roundedWatchedTime = 0;
          stopwatch.start();
          stopWatchTime = stopwatch.elapsedMilliseconds / 1000;
          roundedWatchedTime = stopWatchTime.round();
          if ((roundedWatchedTime / 60) >= points) {
            points = 0;
            title_txt = "Available points: " + points.toString();
            _controller.pause();
            stopwatch.stop();
            stopWatchTime = 0;
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          }
        } else if (mounted && !_controller.value.isPlaying) {
          stopwatch.stop();
        } else if (!mounted) {
          stopwatch.stop();
          stopwatch.reset();
          roundedWatchedTime = 0;
          stopWatchTime = 0;
        } else {
          print('Nothing');
        }

        // if (mounted && roundedWatchedTime >= points){
        //   _controller.pause();
        // }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            print('Player is ready.');
          },
        ),
        builder: (context, player) => Scaffold(
            appBar: AppBar(
                title: const Text(
              'Youtube Player Flutter',
              style: TextStyle(color: Colors.white),
            )),
            body: Column(children: [
              player,
            ])));
  }
}
