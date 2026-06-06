import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String operacion = "";
  String resultado = "0";
  String numeroActual = "";
  List<String> elementos = [];
  List<String> lista = [];
  int i = 0;

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
                  children: [
                    Text(
                      operacion,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      resultado,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(children: [boton('C'), boton('CE'), boton('%'), boton('←')]),
            Row(children: [boton('7'), boton('8'), boton('9'), boton('/')]),
            Row(children: [boton('4'), boton('5'), boton('6'), boton('*')]),
            Row(children: [boton('1'), boton('2'), boton('3'), boton('-')]),
            Row(children: [boton('0'), boton('.'), boton('='), boton('+')]),
          ],
        ),
      ),
    );
  }

  void actionButton(String valor) {
    //print(valor);
    setState(() {
      switch (valor) {
        case 'C ':
          operacion = "";
          resultado = "";
          break;
        case 'CE':
          operacion = "";
          break;
        case '←':
          if (operacion.isNotEmpty) {
            operacion = operacion.substring(0, operacion.length - 1);
          }
          break;

        case "+":
        case "-":
        case "*":
        case "/":
          if (numeroActual.isNotEmpty) {
            elementos.add(numeroActual);
            elementos.add(valor);
            numeroActual = "";
            operacion += valor;
          }
          print(elementos);

          break;
        case "=":
          if (numeroActual.isNotEmpty) {
            elementos.add(numeroActual);
          }

          lista = List.from(elementos);
          bool hayOperadores = true;

          while (hayOperadores) {
            hayOperadores = false;

            for (i = 0; i < lista.length; i++) {
              if (lista[i] == '*' || lista[i] == '/') {
                double num1 = double.parse(lista[i - 1]);
                double num2 = double.parse(lista[i + 1]);
                double r = 0;

                if (lista[i] == "*") {
                  r = num1 * num2;
                } else {
                  r = num1 / num2;
                }

                lista.replaceRange(i - 1, i + 2, [r.toString()]);
                hayOperadores = true;

                break;
              }
            }
          }
          double total = double.parse(lista[0]);
          for(int i = 1; i<lista.length; i+=2){
            String operdor = lista[i];

            double numero = double.parse(lista[i+1]);

            switch(operdor){
              case "+":
              total += numero;
              break;
              case "-":
              total -= numero;
              break;
            }
          }
          resultado = total.toString();
          elementos.clear();
          numeroActual = resultado;
          break;

        default:
          operacion += valor;
          numeroActual += valor;
          break;
      }
    });
  }

  Widget boton(String texto) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          actionButton(texto);
        },
        child: Text(texto),
      ),
    );
  }
}
