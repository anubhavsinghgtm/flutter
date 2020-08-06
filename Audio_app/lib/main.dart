import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool playinButton = false;
  var internetAudio = AudioPlayer();
  var assetsAudio = AudioCache();
  // ignore: non_constant_identifier_names
  MyToast(var message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.blueAccent,
        gravity: ToastGravity.BOTTOM,
        fontSize: 18.0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Music App'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 25),
                      padding: EdgeInsets.only(right: 25),
                      child: FlatButton(
                        color: Colors.amber,
                        disabledTextColor: Colors.grey,
                        child: Text("Audio"),
                        onPressed: null,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      padding: EdgeInsets.only(left: 25),
                      child: FlatButton(
                        disabledTextColor: Colors.grey,
                        child: Text("Video"),
                        onPressed:null
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,
                      color: Colors.amber,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(20),
                            width: 100,
                            height: 100,
                            child: Image.asset('images/img.png'),
                          ),
                          Text(
                            'Play Music From Internet',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                iconSize: 35,
                                icon: Icon(Icons.play_arrow),
                                onPressed: () async {
                                  if (playinButton == false) {
                                    MyToast("Playing your song!");
                                    var url =
                                        "https://github.com/gaurav-gupta-gtm/flutter_training/raw/master/Dooriyan_-_Dino_James_ft._Kaprila_%5BOfficial_Music_Video%5D(256k).mp3";
                                    var playSong =
                                        await internetAudio.play(url);
                                    print(playSong);
                                    setState(() {
                                      playinButton = true;
                                    });
                                  }
                                },
                              ),
                              IconButton(
                                  iconSize: 35,
                                  icon: Icon(Icons.pause),
                                  onPressed: () async {
                                    MyToast('Paused!');
                                    var pauseSong = await internetAudio.pause();
                                    print(pauseSong);

                                    setState(() {
                                      playinButton = false;
                                    });
                                  }),
                              IconButton(
                                  iconSize: 35,
                                  icon: Icon(Icons.stop),
                                  onPressed: () {
                                    MyToast("Stoppped!");
                                    setState(() {
                                      playinButton = false;
                                    });
                                  })
                            ],
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,
                      color: Colors.amber,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(20),
                            width: 100,
                            height: 100,
                            child: Image.asset('images/img.png'),
                          ),
                          Text(
                            'Play Music From Assets',
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                iconSize: 35,
                                icon: Icon(Icons.play_arrow),
                                onPressed: () async {
                                  if (playinButton == false) {
                                    MyToast("Song Played!");
                                    //var url =
                                    //   "https://github.com/gaurav-gupta-gtm/flutter_training/raw/master/Dooriyan_-_Dino_James_ft._Kaprila_%5BOfficial_Music_Video%5D(256k).mp3";
                                    var playSong =
                                        await assetsAudio.play('audio1.mp3');
                                    print(playSong);
                                    setState(() {
                                      playinButton = true;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
