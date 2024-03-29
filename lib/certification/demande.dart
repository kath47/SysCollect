import 'package:flutter/material.dart';

class DemandePage extends StatefulWidget {
  const DemandePage({Key? key}) : super(key: key);

  @override
  State<DemandePage> createState() => _DemandePageState();
}

class _DemandePageState extends State<DemandePage> {
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demande d'enquête officielle pour l'établissement d'un certificat foncier"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextFormField('Nom', Icons.person),
                    _buildTextFormField('Prénoms', Icons.person),
                    _buildDateFormField(),
                    
                    _buildTextFormField('Nom et prénoms du père', Icons.person_4 ),
                    _buildTextFormField('Nom et prénoms de la mère', Icons.person_2),
                    _buildTextFormField('Nationalité', Icons.flag),
                    _buildTextFormField('Profession', Icons.work),
                    _buildTextFormField("Nature de la pièce d'identité", Icons.assignment_ind),
                    _buildTextFormField("N° pièce d'identité", Icons.branding_watermark),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String labelText, IconData prefixIcon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Ajustez ici la taille du champ de texte
        isCollapsed: true, // Assurez-vous que le champ de texte ne dépasse pas la taille définie par contentPadding
      ),
    ),
  );
}



  Widget _buildDateFormField() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => _selectDate(context),
            child: IgnorePointer(
              child: TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  labelText: 'Date de naissance',
                  prefixIcon: Icon(Icons.calendar_today),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Ajustez ici la taille du champ de texte
                  isCollapsed: true, // Assurez-vous que le champ de texte ne dépasse pas la taille définie par contentPadding
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2.0),
              ),
              labelText: 'Lieu de naissance',
              prefixIcon: Icon(Icons.person_pin_circle),
              contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Ajustez ici la taille du champ de texte
              isCollapsed: true, // Assurez-vous que le champ de texte ne dépasse pas la taille définie par contentPadding
            ),
          ),
        ),
      ],
    ),
  );
}


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(' ')[0];
      });
    }
  }
}

