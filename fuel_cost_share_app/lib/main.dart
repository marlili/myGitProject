import 'package:flutter/material.dart';
import 'package:fuel_cost_share_app/widgets/traveller_counter.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fgift',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepOrange)),
      home: Fgift(),
    );
  }
}

class Fgift extends StatefulWidget {
  const Fgift({super.key});

  @override
  State<Fgift> createState() => _FgiftState();
}

class _FgiftState extends State<Fgift> {
  int _personCount = 1;
  double _fuelTotalCost = 0.0;
  double _giftPercentage = 0.0;

  double totalPerTraveller() {
    return ((_fuelTotalCost * _giftPercentage) + (_fuelTotalCost)) / _personCount;
  }

  double totalGift() {
    return ((_fuelTotalCost * _giftPercentage));
  }

  void decrement() {
    setState(() {
      if (_personCount > 1) {
        _personCount--;
      }
    });
  }

  void increment() {
    setState(() {
      _personCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerTraveller();
    double totalT = totalGift();
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Fuel Cost Sharing')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text('Total Fuel Cost Per Traveller', style: style),
                Text(
                  '£${total.toStringAsFixed(2)}',
                  style: style.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontSize: theme.textTheme.displaySmall?.fontSize,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Fuel Cost',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _fuelTotalCost = double.tryParse(value) ?? 0;             
                      });
                    },
                  ),
                  //Split Bill area
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Split', style: theme.textTheme.titleMedium),
                        TravellerCounter(
                          theme: theme,
                          personCount: _personCount,
                          onDecrement: decrement,
                          onIncrement: increment,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tip', style: theme.textTheme.titleMedium),
                        Text('£${totalT.toStringAsFixed(2)}', style: theme.textTheme.titleMedium),
                      ],
                    ),
                  ),
                  Text('${(_giftPercentage * 100).round()}'),
                  Slider(
                    value: _giftPercentage,
                    onChanged: (value) {
                      setState(() {
                        _giftPercentage = value;
                      });
                    },
                    min: 0,
                    max: 0.5,
                    divisions: 5,
                    label: '${(_giftPercentage * 100).round()}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


