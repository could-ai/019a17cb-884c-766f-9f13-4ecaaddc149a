class Asset {
  final String symbol;
  final String name;
  final double price;
  final double changePercent24Hr;

  Asset({
    required this.symbol,
    required this.name,
    required this.price,
    required this.changePercent24Hr,
  });
}
