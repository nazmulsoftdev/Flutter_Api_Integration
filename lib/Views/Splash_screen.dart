import 'dart:async';

import 'package:app2/Views/Home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen())));
    return Scaffold(
      body: SafeArea(
        child: Center(child: CircleAvatar(radius: 20,child: Text("API")),),
      ),
    );
  }
}
