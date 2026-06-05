import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NumerosPrimos(),
    );
  }
}

class NumerosPrimos extends StatefulWidget {
  const NumerosPrimos({super.key});

  @override
  State<NumerosPrimos> createState() => _NumerosPrimosState();
}

class _NumerosPrimosState extends State<NumerosPrimos> {
  String resultado = "";

  bool esPrimo(int numero) {
    if (numero < 2) {
      return false;
    }

    for (int i = 2; i < numero; i++) {
      if (numero % i == 0) {
        return false;
      }
    }

    return true;
  }

  void generarPrimos() {
    List<int> primos = [];

    for (int i = 2; i <= 100; i++) {
      if (esPrimo(i)) {
        primos.add(i);
      }
    }

    setState(() {
      resultado = primos.join(", ");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Números Primos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: generarPrimos,
              child: const Text("Mostrar Números Primos"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  resultado,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
