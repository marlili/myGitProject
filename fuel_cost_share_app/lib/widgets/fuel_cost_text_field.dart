import 'package:flutter/material.dart';

/// Text field for entering the fuel cost
class FuelCostTextField extends StatelessWidget {
  const new({
    super.key,
    required this.fuelCostChange
  });
  /// Called when a value is entered for the fuel cost
  final ValueChanged<String> fuelCostChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Fuel Cost',
      ),
      keyboardType: TextInputType.number,
      onChanged: fuelCostChange,
    );
  }
}
