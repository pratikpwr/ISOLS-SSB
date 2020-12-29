import 'package:flutter/material.dart';
import 'package:how_to_crack_ssb/home_screen.dart';
import 'dart:async';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 1500),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomeScreen();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/logo_hd_50.png',
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'How To Crack SSB',
              style: TextStyle(fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
