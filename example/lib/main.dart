import 'package:flutter/material.dart';
import 'package:flutter_network_status/flutter_network_status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NetworkProvider(
      child: MaterialApp(
        title: 'Network Provider',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('QuoteView'),
        centerTitle: true,
      ),
      body: Center(
        child: NetworkListener(
          builder: (context, value) {
            return Text(
              'Network is ${value ? "Available" : "Unavailable"}',
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
      ),
    );
  }
}
