import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class OpenContainerTransformDemo extends StatelessWidget {
  const OpenContainerTransformDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenContainer Transform Demo'),
      ),
      body: Center(
        child: OpenContainer(
          transitionDuration: const Duration(milliseconds: 500),
          closedBuilder: (context, action) {
            return Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Tap to Open',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            );
          },
          openBuilder: (context, action) {
            return GestureDetector(
              onTap: () {
                action();
              },
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Tap to close',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
