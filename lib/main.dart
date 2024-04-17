import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:test_animations/pages/fade_scale_transition.dart';
import 'package:test_animations/pages/fade_through_transition.dart';
import 'package:test_animations/pages/open_container_transform.dart';
import 'package:test_animations/pages/shared_axis_transition.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: _TransitionsHomePage(),
    ),
  );
}

class _TransitionsHomePage extends StatefulWidget {
  @override
  _TransitionsHomePageState createState() => _TransitionsHomePageState();
}

class _TransitionsHomePageState extends State<_TransitionsHomePage> {
  bool _slowAnimations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material Transitions')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  _TransitionListTile(
                    title: 'Container transform',
                    subtitle: 'OpenContainer',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return const OpenContainerTransformDemo();
                          },
                        ),
                      );
                    },
                  ),
                  _TransitionListTile(
                    title: 'Shared axis',
                    subtitle: 'SharedAxisTransition',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return const SharedAxisTransitionDemo();
                          },
                        ),
                      );
                    },
                  ),
                  _TransitionListTile(
                    title: 'Fade through',
                    subtitle: 'FadeThroughTransition',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return const FadeThroughTransitionDemo();
                          },
                        ),
                      );
                    },
                  ),
                  _TransitionListTile(
                    title: 'Fade',
                    subtitle: 'FadeScaleTransition',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return const FadeScaleTransitionDemo();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(height: 0.0),
            SafeArea(
              child: SwitchListTile(
                value: _slowAnimations,
                onChanged: (bool value) async {
                  setState(() {
                    _slowAnimations = value;
                  });
                  // Wait until the Switch is done animating before actually slowing
                  // down time.
                  if (_slowAnimations) {
                    await Future<void>.delayed(
                        const Duration(milliseconds: 300));
                  }
                  timeDilation = _slowAnimations ? 7.0 : 1.0;
                },
                title: const Text('Slow animations'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransitionListTile extends StatelessWidget {
  const _TransitionListTile({
    this.onTap,
    required this.title,
    required this.subtitle,
  });

  final GestureTapCallback? onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        onTap: onTap,
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
