
import 'package:flutter/material.dart';

class DemandePage extends StatelessWidget {
  const DemandePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demande d'enquête officielle"),
      ),
      body: const Center(
        child: Text('Second Page Content'),
      ),
    );
  }
}
