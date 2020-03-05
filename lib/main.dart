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
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_outline, size: 120, color: Colors.green),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Peso em KG",
                labelStyle: TextStyle(color: Colors.green, fontSize: 25)),
            textAlign: TextAlign.center,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Peso em CM",
                labelStyle: TextStyle(color: Colors.green, fontSize: 25)),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
