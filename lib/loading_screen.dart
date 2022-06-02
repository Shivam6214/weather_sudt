import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading_screen()
    );
  }
}

class loading_screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(children:[Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.purple, Colors.blue],
        ),
      ),
      child: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 150.0,
          duration: Duration(milliseconds: 1200),
        ),
      ),
    ),]);
  }
}