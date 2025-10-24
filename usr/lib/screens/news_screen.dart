import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market News & Sentiment'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: const Center(
        child: Text(
          'News and sentiment analysis will be displayed here.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
