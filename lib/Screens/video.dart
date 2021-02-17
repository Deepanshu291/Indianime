
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'record.dart';
//import 'package:mx_player_plugin/mx_player_plugin.dart';



//import '../model/movie.dart';
//import 'package:flutter_movie_app/main.dart';



class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.videoUrl, Key key});
//ChewieDemo( this.title = )
  //final String title;
  final Record videoUrl;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}
/*
Future gp(BuildContext context,final video) async{

Map result = await PlayerPlugin.openWithMxPlayer();

}*/

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;
  
 

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
          widget.videoUrl.video
        //'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
        
        );
      
   /* _videoPlayerController2 = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/480/asdasdas.mp4');*/
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      allowedScreenSleep: false,
      
     
      
      //fullScreenByDefault: true,
      //allowFullScreen: true,
      
      //fullScreenByDefault: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }
 
  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(widget.videoUrl.name),
         // backgroundColor: Colors.red,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){ Navigator.pop(context); } ),
        ),
      //  endDrawer: DR(),
       // drawer: DR(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
               child: Column(
                 children: <Widget>[
                    Chewie(
                  controller: _chewieController,
                ),
                 ],
               ), 
                
              ),
            ),


        
            /*
            FlatButton(
              onPressed: () {
                _chewieController.enterFullScreen();
              },
              child: Text('Fullscreen'),
            ),
            Row(
              children: <Widget>[
               // Text(widget.videoUrl),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _chewieController.dispose();
                        _videoPlayerController2.pause();
                        _videoPlayerController2.seekTo(Duration(seconds: 0));
                        _chewieController = ChewieController(
                          videoPlayerController: _videoPlayerController1,
                          aspectRatio: 3 / 2,
                          autoPlay: true,
                          looping: true,
                         // fullScreenByDefault: true,
                        );
                      });
                    },
                    child: Padding(
                      child: Text("Video 1"),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _chewieController.dispose();
                        _videoPlayerController1.pause();
                        _videoPlayerController1.seekTo(Duration(seconds: 0));
                        _chewieController = ChewieController(
                          videoPlayerController: _videoPlayerController2,
                          aspectRatio: 3 / 2,
                          autoPlay: true,
                          looping: true,
                        );
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text("Error Video"),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _platform = TargetPlatform.android;
                      });
                    },
                    child: Padding(
                      child: Text("Android controls"),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _platform = TargetPlatform.iOS;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text("iOS controls"),
                    ),
                  ),
                )
              ],
            )*/
          ],
        ),
     // ),
   //  floatingActionButton: FloatingActionButton( onPressed: (){
       //  return PlayerPlugin(widget.videoUrl);
       // return gp(context,widget.videoUrl); },child: Icon(Icons.play_arrow), ),
    );
  }
}

