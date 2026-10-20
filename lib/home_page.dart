import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  //variables
  String _message  = "";
  double? _imc;
  Color _textColor=Colors.white;
  final TextEditingController _weightController=TextEditingController();
  final TextEditingController _heightController=TextEditingController();
  final _formKey = GlobalKey<FormState>();

// Cycle de vie
  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  // Méthodes privées
  void _resetFields(){
    _formKey.currentState?.reset();
    _weightController.clear();
    _heightController.clear();
    setState(() {
      _imc = null;
      _message = "";
      _textColor = Colors.white;

    });
  }
void _calculerIMC() {
  double poids = double.parse(_weightController.text);
  double taille = double.parse(_heightController.text);

  double resultat = poids / (taille * taille);

  String msg;
  Color couleur;
  if (resultat >= 40) {
    msg = "Obésité morbide";
    couleur=Colors.red;
  } else if (resultat >= 35) {
    msg = "Obésité sévère";
    couleur=Colors.deepOrangeAccent;
  } else if (resultat >= 30) {
    msg = "Obésité modérée";
    couleur=Colors.orangeAccent;
  } else if (resultat >= 25) {
    msg = "Surpoids";
    couleur=Colors.yellow;
  } else if (resultat >= 18.5) {
    msg = "Corpulence normale";
    couleur=Colors.green;
  } else {
    msg = "Maigreur";
    couleur=Colors.blueAccent;
  }

  setState(() {
    _imc = resultat;
    _message = msg;
    _textColor=couleur;
  });
}
// Interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculateur d'IMC"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        actions: [
          IconButton(onPressed:  _resetFields, icon: Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Poids",
                style: TextStyle(color: Colors.green, fontSize: 24),),

                Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(30, 30, 10, 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha(50),
                              blurRadius: 1,
                              spreadRadius: 0.2,
                              offset: Offset(1, 3),
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: TextFormField(
                            controller: _weightController,
                            keyboardType:TextInputType.number ,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Veuillez saisir votre poids";
                              }
                              double? poids = double.tryParse(value);
                              if (poids == null) {
                                return "Nombre invalide";
                              }
                              if (poids < 20 || poids > 300) {
                                return "Le poids doit être compris entre 20 et 300 kg";
                              }
                              return null;
                            },
                            textAlign:TextAlign.right,
                        decoration: InputDecoration(hintText: "Exp: 70.0",
                          hintStyle: TextStyle(color: Colors.black26, fontSize: 20),
                          suffixIcon: Text("KG",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        )
                        )
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Taille",
                style: TextStyle(color: Colors.green, fontSize: 24),),

                Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(30, 30, 10, 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha(50),
                              blurRadius: 1,
                              spreadRadius: 0.2,
                              offset: Offset(1, 3),
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: TextFormField(
                            controller: _heightController,
                            keyboardType:TextInputType.number ,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                               return "Veuillez saisir votre taille";
                              }
                              double? taille = double.tryParse(value);
                              if (taille == null) {
                               return "Nombre invalide";
                               }
                               if (taille < 1.0 || taille > 2.5) {
                               return "La taille doit être comprise entre 1 et 2,5 m";
                               }
                              return null;

                            },

                            textAlign:TextAlign.right,
                        decoration: InputDecoration(hintText: "Exp: 1.75",
                          hintStyle: TextStyle(color: Colors.black26, fontSize: 20),
                          suffixIcon: Text("M",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        )
                        )
                    ))
              ],
            ),
            Container(
              margin:EdgeInsets.fromLTRB(0, 30, 0, 20)              ,
              child: ElevatedButton(onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _calculerIMC();
                    }
              }
              ,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green,), child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Calculer",style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            )
            ),
            if (_imc != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text( "Votre état :", style: TextStyle(fontSize: 18,color: Colors.black26),),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:
              Column(
                  children: [
              if (_imc != null)
               Text(
             "IMC : ${_imc!.toStringAsFixed(2)}",
             style: TextStyle(
             fontSize: 24,
            fontWeight: FontWeight.bold,
             ),
           ),
         SizedBox(height: 10),
    Text(
     _message ,
    style: TextStyle(
    //color: Colors.black,
      color: _textColor,
    fontSize: 26,
    ),
    ),
    ],
    )

    ),

            if (_imc != null && _imc! >=10 && _imc! <=80)
              SleekCircularSlider(
              min: 10,
              max: 80,
              initialValue: _imc!.clamp(10.0, 80.0),
              appearance: CircularSliderAppearance(
                startAngle: 150,
                angleRange: 240,
                customColors: CustomSliderColors(
                  progressBarColor: _textColor,
                  trackColor: Colors.grey.shade300,
                ),
              ),
              innerWidget: (value) => Center(
                child: Text(
                  _imc!.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: _textColor,
                  ),
                ),
              ),
            )

          ],
        ),
        ),
      ),
    );
  }
}
