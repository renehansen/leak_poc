import 'package:flutter/material.dart';
import 'package:leak_poc/animation_controller_example.dart';
import 'package:leak_poc/flare_example.dart';
import 'package:leak_poc/lottie_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        buildRow(context, "Lottie example", const LottieExample()),
        buildRow(context, "AnimationController example",
            const AnimationControllerExample()),
        buildRow(context, "Flare example", const FlareExample()),
      ],
    ));
  }

  GestureDetector buildRow(
      BuildContext context, String title, Widget destination) {
    return GestureDetector(
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () => navigateTo(context, destination));
  }
}

void navigateTo(BuildContext context, Widget destination) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => destination,
  ));
}
