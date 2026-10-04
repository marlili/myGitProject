import 'package:flutter/material.dart';

/// Increment and decrement buttons for the number of travellers
class TravellerCounter extends StatelessWidget {
  const TravellerCounter({
    super.key,
    required this.theme,
    required this._personCount,
    required this.onDecrement,
    required this.onIncrement,
  });

  final ThemeData theme;
  final int _personCount;
  /// Called when decrement is pressed
  final VoidCallback onDecrement;
  /// Called when increment is pressed
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          color: theme.colorScheme.primary,
          onPressed: onDecrement,
          icon: const Icon(Icons.remove),
        ),
        Text('$_personCount'),
        IconButton(
          color: theme.colorScheme.primary,
          onPressed: onIncrement,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}