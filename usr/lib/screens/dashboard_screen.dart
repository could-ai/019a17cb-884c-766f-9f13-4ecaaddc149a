import 'package:flutter/material.dart';
import 'package:profitify/models/asset_model.dart';
import 'package:profitify/services/api_service.dart';
import 'package:profitify/widgets/asset_card.dart';
import 'package:profitify/widgets/asset_toggle_switch.dart';

enum AssetType { crypto, stocks }

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<List<Asset>> _cryptoAssets;
  late Future<List<Asset>> _stockAssets;
  AssetType _selectedAssetType = AssetType.crypto;

  @override
  void initState() {
    super.initState();
    _cryptoAssets = ApiService.getTopCrypto();
    _stockAssets = ApiService.getTopStocks();
  }

  void _onAssetTypeChanged(AssetType assetType) {
    setState(() {
      _selectedAssetType = assetType;
    });
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
            AssetToggleSwitch(
              selectedType: _selectedAssetType,
              onChanged: _onAssetTypeChanged,
            ),
            const SizedBox(height: 24),
            _buildSectionTitle(
              context,
              _selectedAssetType == AssetType.crypto
                  ? 'Top Cryptocurrencies'
                  : 'Top Stocks (PSX & Global)',
            ),
            _buildAssetList(),
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

  Widget _buildAssetList() {
    final futureAssets = _selectedAssetType == AssetType.crypto
        ? _cryptoAssets
        : _stockAssets;

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
