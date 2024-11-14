import 'package:flutter/material.dart';

class CurrencyConversion extends StatefulWidget {
  @override
  _CurrencyConversionState createState() => _CurrencyConversionState();
}

class _CurrencyConversionState extends State<CurrencyConversion> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;

  // Kurs mata uang yang digunakan untuk konversi
  final Map<String, double> rates = {
    'USD': 1.0,
    'EUR': 0.9,
    'JPY': 110.0,
    'KRW': 1300.0,
    'IDR': 15000.0, // Rupiah
  };

  String fromCurrency = 'USD'; // Mata uang asal
  String toCurrency = 'IDR'; // Mata uang tujuan

  void _convert() {
    double value = double.tryParse(_controller.text) ?? 0.0;

    // Konversi berdasarkan mata uang asal dan tujuan
    setState(() {
      double fromRate = rates[fromCurrency] ?? 1.0;
      double toRate = rates[toCurrency] ?? 1.0;
      _result = value * (toRate / fromRate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Konversi Mata Uang')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Masukkan Jumlah'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),

            // Label "Dari"
            Text('Dari:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: fromCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  fromCurrency = newValue!;
                });
              },
              items: rates.keys.map<DropdownMenuItem<String>>((String value) {
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
              value: toCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  toCurrency = newValue!;
                });
              },
              items: rates.keys.map<DropdownMenuItem<String>>((String value) {
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
            Text('Hasil: $_result $toCurrency', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
