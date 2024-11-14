import 'package:flutter/material.dart';
import 'calculator.dart';
import 'conversion_weight.dart';
import 'conversion_distance.dart';
import 'currency_conversion.dart';
import 'bmi_calculator.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CalculatorScreen(),
    WeightConversion(),
    DistanceConversion(),
    CurrencyConversion(),
    BMICalculator(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scale),
            label: 'Konversi Berat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Konversi Jarak',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Konversi Mata Uang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'BMI',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
