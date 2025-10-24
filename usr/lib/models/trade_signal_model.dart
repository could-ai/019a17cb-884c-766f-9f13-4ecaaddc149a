enum SignalType { long, short }

class TradeSignal {
  final String symbol;
  final SignalType type;
  final double entryPrice;
  final double stopLoss;
  final double takeProfit;
  final int confidence; // e.g., 91 for 91%
  final String reason;
  final String duration;

  TradeSignal({
    required this.symbol,
    required this.type,
    required this.entryPrice,
    required this.stopLoss,
    required this.takeProfit,
    required this.confidence,
    required this.reason,
    required this.duration,
  });
}
