import 'package:flutter/material.dart';
import 'package:profitify/models/trade_signal_model.dart';
import 'package:profitify/services/api_service.dart';
import 'package:profitify/widgets/signal_card.dart';

class SignalsScreen extends StatefulWidget {
  const SignalsScreen({super.key});

  @override
  State<SignalsScreen> createState() => _SignalsScreenState();
}

class _SignalsScreenState extends State<SignalsScreen> {
  late Future<List<TradeSignal>> _tradeSignals;

  @override
  void initState() {
    super.initState();
    _tradeSignals = ApiService.getAISignals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Trade Signals'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: FutureBuilder<List<TradeSignal>>(
        future: _tradeSignals,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No signals available right now.'));
          }

          final signals = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: signals.length,
            itemBuilder: (context, index) {
              return SignalCard(signal: signals[index]);
            },
          );
        },
      ),
    );
  }
}
