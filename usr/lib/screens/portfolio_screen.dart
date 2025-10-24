import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: const Center(
        child: Text(
          'User portfolio and auto-invest settings will be here.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
