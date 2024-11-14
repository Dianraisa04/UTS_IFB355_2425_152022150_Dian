import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  String _result = '';

  void _calculateBMI() {
    double weight = double.tryParse(_weightController.text) ?? 0.0;
    double heightCm = double.tryParse(_heightController.text) ?? 0.0;

    if (weight > 0 && heightCm > 0) {
      // Ubah tinggi badan dari cm ke meter
      double heightM = heightCm / 100.0;
      double bmi = weight / (heightM * heightM);

      setState(() {
        if (bmi < 18.5) {
          _result = 'BMI: ${bmi.toStringAsFixed(2)} (Kurus)';
        } else if (bmi >= 18.5 && bmi <= 24.9) {
          _result = 'BMI: ${bmi.toStringAsFixed(2)} (Normal)';
        } else if (bmi >= 25 && bmi <= 29.9) {
          _result = 'BMI: ${bmi.toStringAsFixed(2)} (Overweight)';
        } else {
          _result = 'BMI: ${bmi.toStringAsFixed(2)} (Obesitas)';
        }
      });
    } else {
      setState(() {
        _result = 'Masukkan data yang valid';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalkulator BMI')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Berat Badan (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(labelText: 'Tinggi Badan (cm)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Hitung BMI'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
