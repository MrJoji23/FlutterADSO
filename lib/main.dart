import 'package:flutter/material.dart';
import 'package:primerproyecto/cal.dart';


//Inputs-Formulario
//import 'package:primerproyecto/input.dart';
//void main(){
//  runApp(const Inputs());
//}

//Información de la tarjetaa
//import 'package:primerproyecto/principal.dart';
//void main() {
//  runApp(const ElNombe());
//}

//Creacion de un cuadro
//import 'package:primerproyecto/tarjeta.dart';
//void main(){
//  runApp(const Tarjeta());
//}

void main(){
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora())
  );
}