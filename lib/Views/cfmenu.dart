import 'package:flutter/material.dart';
import 'package:syscollect/certification/demande.dart';

class CertificatFoncierPage extends StatelessWidget {
  const CertificatFoncierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Les étapes du processus"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100, // Taille fixe pour chaque ListView
              child: buildListView(
                context,
                "Demande d'enquête officielle",
                "certificat foncier",
              ),
            ),
            const SizedBox(height: 10), // Espace entre les ListView
            SizedBox(
              height: 100, // Taille fixe pour chaque ListView
              child: buildListView(
                context,
                "PV de recensement des droits coutumiers",
                "",
              ),
            ),
            const SizedBox(height: 10), // Espace entre les ListView
            SizedBox(
              height: 100, // Taille fixe pour chaque ListView
              child: buildListView(
                context,
                "Constat de limite de la parcelle",
                "",
              ),
            ),
            const SizedBox(height: 10), // Espace entre les ListView
            SizedBox(
              height: 100, // Taille fixe pour chaque ListView
              child: buildListView(
                context,
                "Annonce de la présentation publique des résultats de l'enquête officielle",
                "",
              ),
            ),
            const SizedBox(height: 10), // Espace entre les ListView
            SizedBox(
              height: 100, // Taille fixe pour chaque ListView
              child: buildListView(
                context,
                "Ouverture de la publication de l'enquête officielle",
                "",
              ),
            ),
            const SizedBox(height: 10), // Espace entre les ListView
            SizedBox(
              height: 100, // Taille fixe pour chaque ListView
              child: buildListView(
                context,
                "Clôture de la publication de l'enquête officielle",
                "",
              ),
            ),
            const SizedBox(height: 10), // Espace entre les ListView
            SizedBox(
              height: 100, // Taille fixe pour chaque ListView
              child: buildListView(
                context,
                "Constat d'existence continue et paisible des droits coutumiers",
                "",
              ),
            ),
            const SizedBox(height: 10), // Espace entre les ListView
            SizedBox(
              height: 100, // Taille fixe pour chaque ListView
              child: buildListView(
                context,
                "Attestation de Validation de l'enquête officielle",
                "",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context, String title, String subtitle) {
    return GestureDetector(
      onTap: () {
        // Naviguer vers une autre page lorsque l'élément est cliqué
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DemandePage(), // Remplacez SecondPage par la page de destination
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15), // BorderRadius
          ),
          child: ListTile(
            leading: const Icon(Icons.edit_document),
            title: Text(title),
            subtitle: Text(subtitle),
            trailing: const Icon(Icons.menu),
          ),
        ),
      ),
    );
  }
}

