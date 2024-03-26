import 'package:flutter/material.dart';

class StatistiquesPage extends StatelessWidget {
  const StatistiquesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistiques"),
      ),
      body: const Center(
        child: Text(
          'Contenu de la page Statistiques',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}