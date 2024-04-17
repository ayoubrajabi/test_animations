import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class SharedAxisTransitionDemo extends StatefulWidget {
  const SharedAxisTransitionDemo({super.key});

  @override
  State<SharedAxisTransitionDemo> createState() =>
      _SharedAxisTransitionDemoState();
}

class _SharedAxisTransitionDemoState extends State<SharedAxisTransitionDemo> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Axis Transition Demo'),
      ),
      body: Center(
        child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation, secondaryAnimation) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
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
