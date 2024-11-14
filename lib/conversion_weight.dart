import 'package:flutter/material.dart';

class WeightConversion extends StatefulWidget {
  @override
  _WeightConversionState createState() => _WeightConversionState();
}

class _WeightConversionState extends State<WeightConversion> {
  TextEditingController _controller = TextEditingController();
  double _result = 0.0;

  // Map konversi dari masing-masing satuan ke gram (g)
  final Map<String, double> unitToGram = {
    'kg': 1000.0,
    'hg': 100.0,
    'dag': 10.0,
    'g': 1.0,
    'dg': 0.1,
    'cg': 0.01,
    'mg': 0.001,
  };

  String fromUnit = 'kg'; // Satuan asal
  String toUnit = 'g'; // Satuan tujuan

  void _convert() {
    double value = double.tryParse(_controller.text) ?? 0.0;

    setState(() {
      double fromFactor = unitToGram[fromUnit] ?? 1.0;
      double toFactor = unitToGram[toUnit] ?? 1.0;
      _result = value * (fromFactor / toFactor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Konversi Berat')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Masukkan Berat'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),

            // Label "Dari"
            Text('Dari:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: fromUnit,
              onChanged: (String? newValue) {
                setState(() {
                  fromUnit = newValue!;
                });
              },
              items:
                  unitToGram.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Label "Ke"
            Text('Ke:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: toUnit,
              onChanged: (String? newValue) {
                setState(() {
                  toUnit = newValue!;
                });
              },
              items:
                  unitToGram.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _convert,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text('Hasil: $_result $toUnit', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
