import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TestimonialsScreen extends StatelessWidget {
  final List<String> videoIdList = [
    'xaQSA4rlUfA',
    'cFYHX1s-45A',
    'Xd-NjOAudHo',
    'A0K6VDmCY54'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IAF Aspirants Testimonials'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            YoutubeWidget('xaQSA4rlUfA', 'Himanshi Sharma'),
            YoutubeWidget('cFYHX1s-45A', 'Neeraj'),
            YoutubeWidget('Xd-NjOAudHo', 'Parthrajsinh Makwana'),
            YoutubeWidget('A0K6VDmCY54', 'Aryan Puri'),
          ],
        ),
      ),
    );
  }
}

class YoutubeWidget extends StatefulWidget {
  final String videoId;
  final String name;

  YoutubeWidget(this.videoId, this.name);

  @override
  _YoutubeWidgetState createState() => _YoutubeWidgetState();
}

class _YoutubeWidgetState extends State<YoutubeWidget> {
  YoutubePlayerController _playerController;

  @override
  void initState() {
    super.initState();
    _playerController = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(_playerController.metadata.title);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      elevation: 7,
      child: Column(
        children: [
          YoutubePlayer(
              controller: _playerController,
              width: MediaQuery.of(context).size.width,
              showVideoProgressIndicator: true,
              onReady: () {
                // print('Player is ready.');
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Text(
              'NDA Aspirant ${widget.name} transformation with SSB Recommendation Blueprint Course | How To Crack SSB',
              style: TextStyle(fontSize: 16, color: const Color(0xff2b3636)),
            ),
          )
        ],
      ),
    );
  }
}

class VideoScreen extends StatefulWidget {
  final String id;

  VideoScreen(this.id);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
          print('Player is ready.');
        },
        topActions: <Widget>[
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
