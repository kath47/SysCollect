
import 'package:flutter/material.dart';

class ClarificationPage extends StatelessWidget {
  const ClarificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Création des conditions favorable"),
      ),
      body: const Center(
        child: Text(
          'Contenu de la page Condition favorable',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}