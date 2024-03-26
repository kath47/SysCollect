import 'package:flutter/material.dart';
import 'package:syscollect/Views/certificatfoncier.dart';
import 'package:syscollect/Views/clarification.dart';
import 'package:syscollect/Views/contratfvi.dart';
import 'package:syscollect/Views/dtv.dart';
import 'package:syscollect/Views/parametre.dart';
import 'package:syscollect/Views/statistiques.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> imgData = [
      "lib/assets/clarif.png",
      "lib/assets/dtv.png",
      "lib/assets/Cf1.png",
      "lib/assets/contrat1.png",
      "lib/assets/stats.png",
      "lib/assets/param.png",
    ];

    List<String> titles = [
      "Clarification",
      "Délimitation (DTV)",
      "Certificat Foncier",
      "Contrat FVI",
      "Statistiques",
      "Paramètres",
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green,
          width: width,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(),
                height: height * 0.23,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 55,
                        left: 25,
                        right: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.sort,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                image: const DecorationImage(
                                    image: AssetImage(
                                      "lib/assets/user.png",
                                    ))),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                        left: 20,
                        //right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Menu principal",
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10), // Ajout de marge supplémentaire
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                width: width,
                padding: const EdgeInsets.only(bottom: 20),
                child: GridView.builder(
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 25,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: imgData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Navigation vers la page dédiée en fonction de l'index de l'image
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => getPage(index),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 6,
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              imgData[index],
                              width: 100,
                            ),
                            Text(
                              titles[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  // Fonction pour obtenir la page dédiée en fonction de l'index de l'image
  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const ClarificationPage();
      case 1:
        return const DtvPage();
      case 2:
        return const CertificatFoncierPage();
      case 3:
        return const ContratFviPage();
      case 4:
        return const StatistiquesPage();
      case 5:
        return const ParametresPage();
      default:
        return Container(); // Gestion de cas par défaut
    }
  }



