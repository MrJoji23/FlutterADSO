import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String operacion = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: const Color.fromARGB(255, 188, 214, 41),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      operacion,
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 50),
                    ),
                    Text(
                      '12',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            Row(
                  children: [boton('7'), boton('8'), boton('9'), boton('/')]),
            Row(
                  children: [boton('4'), boton('5'), boton('6'), boton('*')]),
            Row( 
                  children: [boton('1'), boton('2'), boton('3'), boton('-')]),
            Row(
                  children: [boton('0'), boton('.'), boton('='), boton('+')]),
          ],
        ),
      ),
    );
  }

  Widget boton (String texto) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(texto),
      ),
    );
}
}
