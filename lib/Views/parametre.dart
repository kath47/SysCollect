import 'package:flutter/material.dart';

class ParametresPage extends StatelessWidget {
  const ParametresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paramètres"),
      ),
      body: const Center(
        child: Text(
          'Contenu de la page Paramètres',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}