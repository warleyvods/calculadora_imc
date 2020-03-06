import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _nome = "Calculadora de IMC";


  TextEditingController pesoControl = new TextEditingController();
  TextEditingController alturaControl = new TextEditingController();
  TextEditingController infoControl = new TextEditingController();

  String infoText = "Informe Seus Dados";

  void resetarCampo() {
    pesoControl.text="";
    alturaControl.text="";
    setState(() {
    infoText = "";
    });
  }

  void calcularImc() {
    setState(() {
      double peso = double.parse(pesoControl.text);
      double altura = double.parse(alturaControl.text) / 100;
      double imc = peso / (altura * altura);
      print(imc);
      if (imc < 18.6) {
        infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_nome),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              resetarCampo();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120, color: Colors.green),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso em KG",
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25.0)),
              textAlign: TextAlign.center,
              controller: pesoControl,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso em CM",
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25.0)),
              textAlign: TextAlign.center,
              obscureText: false,
              controller: alturaControl,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                  calcularImc();
                  },
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                ),
              ),
            ),
            Container(
                height: 50.0,
                child: Text(
                  infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0),
                ))
          ],
        ),
      ),
    );
  }
}
