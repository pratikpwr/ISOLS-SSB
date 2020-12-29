import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:how_to_crack_ssb/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // navigation bar color
    statusBarColor: const Color(0xff2b3636), //
  )); // status bar
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: const Color(0xff2b3636)),
        debugShowCheckedModeBanner: false,
        home: MySplashScreen());
  }
}
