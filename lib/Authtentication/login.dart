import 'package:flutter/material.dart';
import 'package:syscollect/Authtentication/signup.dart';
import 'package:syscollect/JsonModels/users.dart';
import 'package:syscollect/SQLite/sqlite.dart';
import 'package:syscollect/Views/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Nous avons besoin de deux contrôleurs d'édition de texte
  //Contrôleur TextEditing pour contrôler le texte lorsque nous le saisissons
  final username = TextEditingController();
  final password = TextEditingController();

  //A variable booleen pour afficher et cacher le mot de passe
  bool isVisible = false;

  //Voici notre variable booleen
  bool isLoginTrue = false;

  final db = DatabaseHelper();

  //Nous devons maintenant appeler cette fonction dans le bouton de connexion
  login() async {
    var response = await db
        .login(Users(usrName: username.text, usrPassword: password.text));
    if (response == true) {
      //Si la connexion est correcte, passez aux Dashboard
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Dashboard()));
    } else {
      //Si ce n'est pas le cas, true la valeur bool pour afficher le message d'erreur
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  //Nous devons créer une clé globale pour notre formulaire
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            //Nous avons placé tous nos champs de texte dans un formulaire pour qu'ils soient contrôlés et ne soient pas autorisés à être vides.
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  //Username field
                  //Avant de montrer l'image, nous devons définir l'emplacement dans pubspec.yaml
                  Image.asset(
                    "lib/assets/login.png",
                    width: 210,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.greenAccent.withOpacity(.2)),
                    child: TextFormField(
                      controller: username,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mot de passe est obligatoire";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: "Username",
                      ),
                    ),
                  ),

                  //Champ du mot de passe
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.greenAccent.withOpacity(.2)),
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mot de passe est obligatoire";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                //Ici, nous allons créer un bouton pour afficher et masquer le mot de passe.
                                setState(() {
                                  //toggle button
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                  ),

                  const SizedBox(height: 10),
                  //Bouton de connexion
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green),
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            //La méthode de connexion se trouve ici
                            login();

                            //Nous avons maintenant une réponse de notre méthode sqlite
                            //Nous allons créer un utilisateur
                          }
                        },
                        child: const Text(
                          "CONNEXION",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),

                  //Bouton d'inscription
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Vous n'avez pas de compte ?"),
                      TextButton(
                          onPressed: () {
                            //Naviguer pour s'inscrire
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: const Text("S'INSCRIRE"))
                    ],
                  ),

                  // Ce message sera désactivé par défaut, mais si l'utilisateur et le mot de passe sont incorrects, ce message sera envoyé à l'utilisateur.
                  isLoginTrue
                      ? const Text(
                          "Le nom d'utilisateur ou le mot de passe est incorrect",
                          style: TextStyle(color: Colors.red),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
