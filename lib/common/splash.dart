import 'dart:async';
import 'package:flutter/material.dart';
import 'package:study_with_game/auth/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() =>
      _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 4),

          () {

        Navigator.pushReplacement(
          context,

          MaterialPageRoute(
            builder: (context) =>
            const Login(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Image.asset(
              "assets/logo/logo.png",

              width: 240,
              height: 240,
            ),

            const SizedBox(height: 20),


          ],
        ),
      ),
    );
  }
}