import 'package:flutter/material.dart';
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
  void _resetFields(){
    setState(() {
      weightController.clear();
      heightController.clear();
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
  } else if (resultat >= 35) {
    msg = "Obésité sévère";
  } else if (resultat >= 30) {
    msg = "Obésité modérée";
  } else if (resultat >= 25) {
    msg = "Surpoids";
  } else if (resultat >= 18.5) {
    msg = "Corpulence normale";
  } else {
    msg = "Maigreur";
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
        child: Form(child:
        Column(
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
                            keyboardType:TextInputType.number ,textAlign:TextAlign.right,
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
                            keyboardType:TextInputType.number ,textAlign:TextAlign.right,
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
              child: ElevatedButton(onPressed: calculerIMC,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green,), child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Calculer",style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Votre état :", style: TextStyle(fontSize: 18,color: Colors.black26),),
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
    color: Colors.black,
    fontSize: 26,
    ),
    ),
    ],
    )

    ),

          ],
        ),
        ),
      ),
    );
  }
}
