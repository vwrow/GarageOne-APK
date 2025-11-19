import 'package:flutter/material.dart';
import 'package:velg/pages/home.dart';
import 'package:velg/pages/profile.dart';
import 'package:velg/pages/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      theme: ThemeData(
        fontFamily: "Popins"
      ),
      routes: {
        "/splash": (context) => SplashScreen(),
        "/home": (context) => HomePage(),
        "/profile": (context) => profilePage(),
      },

    );
  }
}
