import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeThroughTransitionDemo extends StatefulWidget {
  const FadeThroughTransitionDemo({super.key});

  @override
  State<FadeThroughTransitionDemo> createState() =>
      _FadeThroughTransitionDemoState();
}

class _FadeThroughTransitionDemoState extends State<FadeThroughTransitionDemo> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade Through Transition Demo'),
      ),
      body: Center(
        child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 500),
          reverse: true,
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: _isOpen ? _buildContainer(_isOpen) : _buildContainer(_isOpen),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 150.0,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _isOpen = !_isOpen;
            });
          },
          child: Text(!_isOpen ? 'next' : 'previous'),
        ),
      ),
    );
  }

  Widget _buildContainer(bool isOpen) {
    return Container(
      key: ValueKey(isOpen ? 'close' : 'open'),
      color: isOpen ? Colors.amber : Colors.indigo,
      child: Center(
        child: Text(
          !isOpen ? 'Opened' : 'Closed',
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}
