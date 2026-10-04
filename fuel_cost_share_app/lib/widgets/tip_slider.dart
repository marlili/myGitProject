import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const new({
    super.key,
    required this._giftPercentage,
    required this.percentageChange
  });

  final double _giftPercentage;
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