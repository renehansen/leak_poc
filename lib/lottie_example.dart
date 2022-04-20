import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieExample extends StatelessWidget {
  const LottieExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Lottie example")),
        body: ListView(
          children: [
            // Load a Lottie file from your assets
            Lottie.asset('assets/lottie_animation.json'),
          ],
        ),
      ),
    );
  }
}