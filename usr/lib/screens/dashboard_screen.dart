import 'package:flutter/material.dart';
import 'package:profitify/models/asset_model.dart';
import 'package:profitify/services/api_service.dart';
import 'package:profitify/widgets/asset_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<List<Asset>> _cryptoAssets;
  late Future<List<Asset>> _stockAssets;

  @override
  void initState() {
    super.initState();
    _cryptoAssets = ApiService.getTopCrypto();
    _stockAssets = ApiService.getTopStocks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profitify Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Top Cryptocurrencies'),
            _buildAssetList(_cryptoAssets),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Top Stocks (PSX & Global)'),
            _buildAssetList(_stockAssets),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _buildAssetList(Future<List<Asset>> futureAssets) {
    return FutureBuilder<List<Asset>>(
      future: futureAssets,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No assets found.'));
        }

        final assets = snapshot.data!;
        return SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: assets.length,
            itemBuilder: (context, index) {
              return AssetCard(asset: assets[index]);
            },
          ),
        );
      },
    );
  }
}
