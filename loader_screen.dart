import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


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
  Widget build(BuildContext context) {
    return LoadingScreen;
  }
}


