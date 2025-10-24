import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profitify/models/asset_model.dart';

class AssetCard extends StatelessWidget {
  final Asset asset;

  const AssetCard({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    final priceFormat = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    final isPositive = asset.changePercent24Hr >= 0;
    final changeColor = isPositive ? Colors.greenAccent : Colors.redAccent;

    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            asset.symbol,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            asset.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
          const Spacer(),
          Text(
            priceFormat.format(asset.price),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            '${isPositive ? '+' : ''}${asset.changePercent24Hr.toStringAsFixed(2)}%',
            style: TextStyle(
              color: changeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
