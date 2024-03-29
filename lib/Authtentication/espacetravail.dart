import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:syscollect/Views/dashboard.dart';

class EspaceTravailDialog extends StatefulWidget {
  const EspaceTravailDialog({Key? key}) : super(key: key);

  @override
  State<EspaceTravailDialog> createState() => _EspaceTravailDialogState();
}

class _EspaceTravailDialogState extends State<EspaceTravailDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  //late SingleValueDropDownController _cnt;
  //late MultiValueDropDownController _cntMulti;

  @override
  void initState() {
    //_cnt = SingleValueDropDownController();
    //_cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // Largeur de 80% de l'écran
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20, width: 40),
                const Text(
                  "SOUS-PREFECTURE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                DropDownTextField(
                  clearOption: false,
                  textFieldFocusNode: textFieldFocusNode,
                  searchFocusNode: searchFocusNode,
                  dropDownItemCount: 5,
                  searchShowCursor: false,
                  enableSearch: true,
                  searchKeyboardType: TextInputType.number,
                  dropDownList: const [
                    DropDownValueModel(name: 'Abidjan', value: "Abidjan"),
                    DropDownValueModel(name: 'Anyama', value: "Anyama"),
                    DropDownValueModel(name: 'Bingerville', value: "Bingerville"),
                    DropDownValueModel(name: 'Abrofodoumé', value: "Abrofodoumé"),
                    DropDownValueModel(name: 'Agboville', value: "Agboville"),
                    DropDownValueModel(name: 'Adzopé', value: "Adzopé"),
                    DropDownValueModel(name: 'Akoupé', value: "Akoupé"),
                    DropDownValueModel(name: 'Alepé', value: "Alepé"),
                  ],
                  onChanged: (val) {},
                ),
                const SizedBox(height: 30),
                const Text(
                  "VILLAGE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                DropDownTextField(
                  clearOption: false,
                  textFieldFocusNode: textFieldFocusNode,
                  searchFocusNode: searchFocusNode,
                  dropDownItemCount: 5,
                  searchShowCursor: false,
                  enableSearch: true,
                  searchKeyboardType: TextInputType.number,
                  dropDownList: const [
                    DropDownValueModel(name: 'Abidjan', value: "Abidjan"),
                    DropDownValueModel(name: 'Anyama', value: "Anyama"),
                    DropDownValueModel(name: 'Bingerville', value: "Bingerville"),
                    DropDownValueModel(name: 'Abrofodoumé', value: "Abrofodoumé"),
                    DropDownValueModel(name: 'Agboville', value: "Agboville"),
                    DropDownValueModel(name: 'Adzopé', value: "Adzopé"),
                    DropDownValueModel(name: 'Akoupé', value: "Akoupé"),
                    DropDownValueModel(name: 'Alepé', value: "Alepé"),
                  ],
                  onChanged: (val) {},
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Annuler
                      },
                      child: const Text('Annuler'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Valider
                          // Implémentez ici votre logique de validation
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const Dashboard()),
                          );
                        }
                      },
                      child: const Text('Valider'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
