import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator BMI',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  double? _bmi;

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    if (height == null || height <= 0 || weight == null || weight <= 0) {
      return;
    }

    setState(() {
      //agar halaman menjadi fleksible tampilannya
      _bmi = weight / pow(height / 100, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: 320,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Tinggi'),
              controller: _heightController,
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Berat',
              ),
              controller: _weightController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _calculate,
              style: ElevatedButton.styleFrom(
                primary: Colors.white54,
                onPrimary: Colors.black,
              ),
              child: const Text('Hitung'),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              _bmi == null ? 'Tidak Ada Isi' : _bmi!.toStringAsFixed(1),
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    ));
  }
}
