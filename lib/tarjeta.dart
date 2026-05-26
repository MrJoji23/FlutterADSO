import 'package:flutter/material.dart';

class Tarjeta extends StatelessWidget {
  const Tarjeta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Terror'),
        ),
        body: Center( 
          child: Container(
            width: 300,
            height: 300,

            margin: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(20),

              
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //Hijos del contenedor 
              children: [

                Column(
                  //Centrar elementos de la columna
                  mainAxisAlignment: MainAxisAlignment.center,
                  //hijos del contendor
                  children: [
                    //hijo 1
                    Icon(
                      Icons.person,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      size: 50,
                      ),
                      //Hijo 2
                      Text(
                        'Homelander', 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),

                    
                  ],
                ),
                //Hijo 2 Column
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Hijos del contenedo
                  children: [
                    //Hijo 1
                    Icon(
                      Icons.phone,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      size: 50,
                    ),
                    //Hijo 2
                    Text(
                      'Bucher',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
          ),
        ),
      );
  }
}