import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class About2 extends StatelessWidget {
  static const routeName = '/About2';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Newsopedia',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  Container(
                    width: 190,
                    height: 2,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(height: 30),
                  Text('Version',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  Text('1.0.1.1',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  SizedBox(height: 30),
                  Text('Last Update',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  Text('November 2020',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  SizedBox(height: 30),
                  Text('Just for educational purpose',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  SizedBox(height: 30),
                  Text('Term of services',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  SizedBox(height: 30),
                  Text('Contact us',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  Text('srivatsanms2000@gmail.com',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
