import 'package:flutter/material.dart';

/// Slider for choosing the tip from 0 to 50 percent
class TipSlider extends StatelessWidget {
  const new({
    super.key,
    required this._giftPercentage,
    required this.percentageChange
  });

  final double _giftPercentage;
  /// Called with the new value when the slider moves
  final ValueChanged<double> percentageChange;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _giftPercentage,
      onChanged: percentageChange,
      min: 0,
      max: 0.5,
      divisions: 5,
      label: '${(_giftPercentage * 100).round()}');
  }
}