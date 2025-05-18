import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 80;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
        color: Color.fromARGB(255, 182, 182, 182),
      ),
      borderRadius: BorderRadius.circular(60),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 225, 225),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 225, 225, 225),
        elevation: 0,
        title: const Text('Currency Converter'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '₹ ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in USD',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: convert,
                style: TextButton.styleFrom(
                  elevation: 2,
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
