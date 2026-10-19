import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String message = "";
  double? imc;
  TextEditingController weightController=TextEditingController();
  TextEditingController heightController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Color textColor=Colors.white;


  void _resetFields(){
    _formKey.currentState?.reset();
    weightController.clear();
    heightController.clear();
    setState(() {
      imc = null;
      message = "";

    });
  }
void calculerIMC() {
  double poids = double.parse(weightController.text);
  double taille = double.parse(heightController.text);

  double resultat = poids / (taille * taille);

  String msg;

  if (resultat >= 40) {
    msg = "Obésité morbide";
    textColor=Colors.red;
  } else if (resultat >= 35) {
    msg = "Obésité sévère";
    textColor=Colors.deepOrangeAccent;
  } else if (resultat >= 30) {
    msg = "Obésité modérée";
    textColor=Colors.orangeAccent;
  } else if (resultat >= 25) {
    msg = "Surpoids";
    textColor=Colors.yellow;
  } else if (resultat >= 18.5) {
    msg = "Corpulence normale";
    textColor=Colors.green;
  } else {
    msg = "Maigreur";
    textColor=Colors.blueAccent;
  }

  setState(() {
    imc = resultat;
    message = msg;
  });
}
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
                            controller: weightController,
                            keyboardType:TextInputType.number ,
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return "Veuillez saisir votre poids";
                              }
                              if (double.tryParse(value)==null) {
                                return "Nombre invalide";
                              }
                              return null;
                            },
                            textAlign:TextAlign.right,
                        decoration: InputDecoration(hintText: "00.0",
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
                            controller: heightController,
                            keyboardType:TextInputType.number ,
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return "Veuillez saisir votre taille";
                              }
                              if (double.tryParse(value)==null) {
                                return "Nombre invalide";
                              }
                              return null;
                            },

                            textAlign:TextAlign.right,
                        decoration: InputDecoration(hintText: "00.0",
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
                      calculerIMC();
                    }
              }
              ,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green,), child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Calculer",style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            )
            ),
            if (imc != null)
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
              if (imc != null)
               Text(
             "IMC : ${imc!.toStringAsFixed(2)}",
             style: TextStyle(
             fontSize: 24,
            fontWeight: FontWeight.bold,
             ),
           ),
         SizedBox(height: 10),
    Text(
     message,
    style: TextStyle(
    //color: Colors.black,
      color: textColor,
    fontSize: 26,
    ),
    ),
    ],
    )

    ),

            if (imc != null && imc! >=10 && imc! <=10080)
              SleekCircularSlider(
              min: 10,
              max: 80,
              initialValue: imc!.clamp(10.0, 80.0),
              appearance: CircularSliderAppearance(
                startAngle: 150,
                angleRange: 240,
                customColors: CustomSliderColors(
                  progressBarColor: textColor,
                  trackColor: Colors.grey.shade300,
                ),
              ),
              innerWidget: (value) => Center(
                child: Text(
                  value.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: textColor,
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
