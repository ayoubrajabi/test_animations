import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeScaleTransitionDemo extends StatefulWidget {
  const FadeScaleTransitionDemo({super.key});

  @override
  State<FadeScaleTransitionDemo> createState() =>
      _FadeScaleTransitionDemoState();
}

class _FadeScaleTransitionDemoState extends State<FadeScaleTransitionDemo> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showModal(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(
        transitionDuration: Duration(seconds: 1),
        reverseTransitionDuration: Duration(seconds: 1),
      ),
      builder: (BuildContext context) {
        return FadeScaleTransition(
          animation: CurvedAnimation(
            parent: ModalRoute.of(context)!.animation!,
            curve: Curves.easeOut,
          ),
          child: DatePickerDialog(
            firstDate: DateTime(2020, 1, 1),
            lastDate: DateTime(2025, 12, 31),
          ),
        );
      },
    );
    if (picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade Scale Transition Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedDate == null
                  ? 'No date selected'
                  : 'Selected Date: ${_selectedDate.toString()}',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select Date'),
            ),
          ],
        ),
      ),
    );
  }
}
