import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  void _resetFields(){
    setState(() {
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
                        child: TextFormField(keyboardType:TextInputType.number ,textAlign:TextAlign.right,
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
                        child: TextFormField(keyboardType:TextInputType.number ,textAlign:TextAlign.right,
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

              },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green,), child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Calculer",style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Vous êtes :", style: TextStyle(fontSize: 18,color: Colors.black26),),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Message",style: TextStyle(color: Colors.black,fontSize: 26),),
            ),

          ],
        ),
        ),
      ),
    );
  }
}
