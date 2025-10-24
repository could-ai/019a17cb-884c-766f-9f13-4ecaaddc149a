import 'package:flutter/material.dart';
import 'package:profitify/screens/dashboard_screen.dart';

class AssetToggleSwitch extends StatelessWidget {
  final AssetType selectedType;
  final ValueChanged<AssetType> onChanged;

  const AssetToggleSwitch({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildToggleButton(context, 'Cryptos', AssetType.crypto),
          _buildToggleButton(context, 'Stocks', AssetType.stocks),
        ],
      ),
    );
  }

  Widget _buildToggleButton(
      BuildContext context, String text, AssetType type) {
    final isSelected = selectedType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(type),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.secondary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? Theme.of(context).colorScheme.onSecondary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
