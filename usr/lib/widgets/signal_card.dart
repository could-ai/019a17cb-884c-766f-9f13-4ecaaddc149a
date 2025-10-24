import 'package:flutter/material.dart';
import 'package:profitify/models/trade_signal_model.dart';

class SignalCard extends StatelessWidget {
  final TradeSignal signal;

  const SignalCard({super.key, required this.signal});

  @override
  Widget build(BuildContext context) {
    final isLong = signal.type == SignalType.long;
    final signalColor = isLong ? Colors.green : Colors.red;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: signalColor, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, signalColor),
            const SizedBox(height: 16),
            Text(
              signal.reason,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            _buildSignalDetails(context),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Color signalColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${signal.symbol} - ${signal.type.name.toUpperCase()}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: signalColor),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${signal.confidence}%',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Text(
              'Confidence',
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSignalDetails(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDetailColumn('Entry', '\$${signal.entryPrice.toStringAsFixed(2)}'),
        _buildDetailColumn('Take Profit', '\$${signal.takeProfit.toStringAsFixed(2)}', color: Colors.greenAccent),
        _buildDetailColumn('Stop Loss', '\$${signal.stopLoss.toStringAsFixed(2)}', color: Colors.redAccent),
        _buildDetailColumn('Duration', signal.duration),
      ],
    );
  }

  Widget _buildDetailColumn(String title, String value, {Color? color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.white70),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, color: color ?? Colors.white),
        ),
      ],
    );
  }
}
