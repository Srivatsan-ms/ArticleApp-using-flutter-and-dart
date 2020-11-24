import 'dart:async';
//import 'dart:html';

import 'package:flutter/material.dart';

import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'My first app'),
      //theme: theme ? dark : light
      routes: <String, WidgetBuilder>{
        '/homePage': (BuildContext context) => HomePage()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() async {
    var duration = Duration(seconds: 2);
    return new Timer(duration, navi);
  }

  void navi() {
    Navigator.pushReplacementNamed(context, '/homePage');
  }

  initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
            "https://images.unsplash.com/photo-1566378246598-5b11a0d486cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
      ),
    );
  }
}
