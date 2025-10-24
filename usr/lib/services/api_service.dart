import 'package:profitify/models/asset_model.dart';
import 'package:profitify/models/trade_signal_model.dart';

// This is a MOCK service class. It simulates API calls and returns fake data.
// In a real application, this would use the 'http' package to make network requests
// to your Python backend and external APIs (Binance, PSX, etc.).

class ApiService {
  // Simulates fetching top crypto assets
  static Future<List<Asset>> getTopCrypto() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return [
      Asset(symbol: 'BTC', name: 'Bitcoin', price: 68123.45, changePercent24Hr: 2.5, url: 'https://www.binance.com/en/trade/BTC_USDT'),
      Asset(symbol: 'ETH', name: 'Ethereum', price: 3540.12, changePercent24Hr: -1.2, url: 'https://www.binance.com/en/trade/ETH_USDT'),
      Asset(symbol: 'SOL', name: 'Solana', price: 165.80, changePercent24Hr: 5.8, url: 'https://www.binance.com/en/trade/SOL_USDT'),
      Asset(symbol: 'BNB', name: 'Binance Coin', price: 590.55, changePercent24Hr: 0.5, url: 'https://www.binance.com/en/trade/BNB_USDT'),
    ];
  }

  // Simulates fetching top stock assets
  static Future<List<Asset>> getTopStocks() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return [
      Asset(symbol: 'PSX:OGDC', name: 'Oil & Gas Dev.', price: 150.75, changePercent24Hr: 1.1, url: 'https://www.google.com/search?q=PSX:OGDC'),
      Asset(symbol: 'AAPL', name: 'Apple Inc.', price: 195.34, changePercent24Hr: -0.5, url: 'https://www.google.com/search?q=NASDAQ:AAPL'),
      Asset(symbol: 'TSLA', name: 'Tesla Inc.', price: 177.48, changePercent24Hr: 3.2, url: 'https://www.google.com/search?q=NASDAQ:TSLA'),
      Asset(symbol: 'PSX:LUCK', name: 'Lucky Cement', price: 750.00, changePercent24Hr: -2.0, url: 'https://www.google.com/search?q=PSX:LUCK'),
    ];
  }

  // Simulates fetching AI-generated trade signals
  static Future<List<TradeSignal>> getAISignals() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return [
      TradeSignal(
        symbol: 'ETH/USDT',
        type: SignalType.long,
        entryPrice: 3550.0,
        stopLoss: 3400.0,
        takeProfit: 3800.0,
        confidence: 91,
        reason: 'RSI rising, MACD crossover confirmed, positive ETF news.',
        duration: '4-6 hours',
      ),
      TradeSignal(
        symbol: 'BTC/USDT',
        type: SignalType.short,
        entryPrice: 68000.0,
        stopLoss: 69500.0,
        takeProfit: 65000.0,
        confidence: 85,
        reason: 'Approaching major resistance, high funding rates.',
        duration: '8-12 hours',
      ),
       TradeSignal(
        symbol: 'PSX:OGDC',
        type: SignalType.long,
        entryPrice: 151.0,
        stopLoss: 145.0,
        takeProfit: 165.0,
        confidence: 78,
        reason: 'Positive earnings report and rising oil prices.',
        duration: '2-3 days',
      ),
    ];
  }
}
