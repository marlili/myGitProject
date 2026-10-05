
import 'package:flutter/material.dart';

/// Display the calculated tip amount based on fuel cost and percentage
class TipDisplay extends StatelessWidget {
  const new({
    super.key,
    required this.theme,
    required this.totalT,
  });

  final ThemeData theme;
  /// Total tip amount
  final double totalT;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Tip', style: theme.textTheme.titleMedium),
        Text('£${totalT.toStringAsFixed(2)}', style: theme.textTheme.titleMedium),
      ],
    );
  }
}