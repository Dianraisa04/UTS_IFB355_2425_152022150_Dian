import 'package:flutter/material.dart';
import 'dart:async'; // Untuk delay
import 'conversion_distance.dart';
import 'conversion_weight.dart';
import 'currency_conversion.dart';
import 'bmi_calculator.dart';
import 'calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Konversi & Kalkulator',
      theme: ThemeData(
        primaryColor: Color(0xFF4CAF50), // Hijau
        hintColor: Color(0xFF6F4F2F), // Coklat
        appBarTheme: AppBarTheme(
          color: Color(0xFF6F4F2F), // Coklat
          elevation: 4.0,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF4CAF50), // Hijau
          unselectedItemColor: Colors.grey[600],
          backgroundColor: Color(0xFF6F4F2F), // Coklat
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(218, 212, 139, 71),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/dian.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your Math',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Dian Raisa Gumilar',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              '152022150',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _menuItems = [
    {
      'icon': Icons.calculate,
      'label': 'Kalkulator',
      'page': CalculatorScreen(),
    },
    {
      'icon': Icons.scale,
      'label': 'Konversi Berat',
      'page': WeightConversion(),
    },
    {
      'icon': Icons.location_on,
      'label': 'Konversi Jarak',
      'page': DistanceConversion(),
    },
    {
      'icon': Icons.attach_money,
      'label': 'Konversi Mata Uang',
      'page': CurrencyConversion(),
    },
    {
      'icon': Icons.health_and_safety,
      'label': 'BMI',
      'page': BMICalculator(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Aplikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
          itemCount: _menuItems.length,
          itemBuilder: (context, index) {
            final item = _menuItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['page']),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item['icon'],
                      size: 50,
                      color: Color(0xFF4CAF50),
                    ),
                    SizedBox(height: 10),
                    Text(
                      item['label'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
