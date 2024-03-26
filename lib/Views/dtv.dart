
import 'package:flutter/material.dart';

class DtvPage extends StatelessWidget {
  const DtvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Délimitation des territoires de villages"),
      ),
      body: const Center(
        child: Text(
          'Contenu de la page DTV',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}