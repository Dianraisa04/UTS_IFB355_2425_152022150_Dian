import 'package:flutter/material.dart';

class DistanceConversion extends StatefulWidget {
  @override
  _DistanceConversionState createState() => _DistanceConversionState();
}

class _DistanceConversionState extends State<DistanceConversion> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;

  // Map konversi dari masing-masing satuan ke meter (m)
  final Map<String, double> unitToMeter = {
    'km': 1000.0,
    'hm': 100.0,
    'dam': 10.0,
    'm': 1.0,
    'dm': 0.1,
    'cm': 0.01,
    'mm': 0.001,
  };

  String fromUnit = 'km'; // Satuan asal
  String toUnit = 'm'; // Satuan tujuan

  void _convert() {
    double value = double.tryParse(_controller.text) ?? 0.0;

    setState(() {
      double fromFactor = unitToMeter[fromUnit] ?? 1.0;
      double toFactor = unitToMeter[toUnit] ?? 1.0;
      _result = value * (fromFactor / toFactor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Konversi Jarak')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Masukkan Jarak'),
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
              items: unitToMeter.keys
                  .map<DropdownMenuItem<String>>((String value) {
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
              items: unitToMeter.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Tombol untuk melakukan konversi
            ElevatedButton(
              onPressed: _convert,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),

            // Menampilkan hasil konversi
            Text('Hasil: $_result $toUnit', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
