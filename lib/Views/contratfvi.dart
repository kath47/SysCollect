import 'package:flutter/material.dart';

class ContratFviPage extends StatelessWidget {
  const ContratFviPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contrat FVI"),
      ),
      body: const Center(
        child: Text(
          'Contenu de la page Contrat FVI',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}