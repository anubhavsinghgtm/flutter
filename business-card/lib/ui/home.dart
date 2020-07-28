import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_app/main.dart';
import 'package:statusbar/statusbar.dart';

myApp() {
  myToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  myCall() {
    print('Called...');
  }

  StatusBar.color(Colors.red.withOpacity(0.2));
  var myHome = Scaffold(
    appBar: AppBar(
      title: Text('Profile Details'),
      backgroundColor: Colors.amber.shade800,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.public), onPressed: myToast),
        IconButton(icon: Icon(Icons.call), onPressed: myCall)
      ],
    ),
    body: Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey.shade500.withOpacity(.5),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 300,
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Anubhav Singh",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  margin: EdgeInsets.only(top: 5),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.email),
                      Text(
                        '  anubhavsinghgtm@gmail.com',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            margin: EdgeInsets.all(60),
            decoration: BoxDecoration(
              color: Colors.amber.shade800,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 100,
            height: 100,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://raw.githubusercontent.com/anubhavsinghgtm/flutter/master/anubhav.jpg'),
              ),
              color: Colors.amber,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
    ),
  );

  return MaterialApp(
    home: myHome,
    debugShowCheckedModeBanner: false,
  );
}
