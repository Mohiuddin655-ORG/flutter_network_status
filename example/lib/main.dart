import 'package:flutter/material.dart';
import 'package:flutter_network_status/network_status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Step - 1:
    /// NetworkProvider use to live observation connectivity
    return NetworkProvider(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Network Provider',
        home: HomePage(),
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
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        /// Step - 2:
        /// NetworkListener use to listener network status when network connection turn on or off
        child: NetworkListener(
          builder: (context, isConnected) {
            return Text(
              'Network is ${isConnected ? "Available" : "Unavailable"}',
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
      ),
    );
  }
}
