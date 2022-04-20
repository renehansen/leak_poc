import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlareExample extends StatefulWidget {
  const FlareExample({Key? key}) : super(key: key);

  @override
  _FlareExampleState createState() => _FlareExampleState();
}

class _FlareExampleState extends State<FlareExample> {
  bool _useAA = true;
  final _animationName = "idle";
  final asset = AssetFlare(bundle: rootBundle, name: "assets/filip.flr");

  /// Toggle antialiasing on [FlareActor]
  void _toggleAntialiasing() {
    setState(() {
      _useAA = !_useAA;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Flare example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: FlareCacheBuilder(
                [asset],
                builder: (BuildContext context, bool isWarm) {
                  return !isWarm
                      ? const Text("NO")
                      : FlareActor.asset(
                          asset,
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: _animationName,
                          antialias: _useAA,
                        );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _toggleAntialiasing,
          child: Icon(
              _useAA ? Icons.center_focus_strong : Icons.center_focus_weak)),
    );
  }
}
