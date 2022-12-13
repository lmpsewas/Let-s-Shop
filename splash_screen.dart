import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _isLoading = true;

  final LoadingScreen = Container(
    color: Colors.black54,
    child: SpinKitCircle(
      color: Colors.deepPurpleAccent,
      size: 60.0,
    ),
  );

  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? LoadingScreen: HomeScreen();
  }
}


