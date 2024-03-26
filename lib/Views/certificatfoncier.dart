import 'package:flutter/material.dart';

class CertificatFoncierPage extends StatelessWidget {
  const CertificatFoncierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Certificat foncier"),
      ),
      body: const Center(
        child: Text(
          'Contenu de la page Certificat foncier',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}