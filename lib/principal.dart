import 'package:flutter/material.dart';

class ElNombe extends StatelessWidget {
  const ElNombe({super.key});

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
            width: 350,

            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: const Color.fromARGB(193, 140, 194, 124),
              borderRadius: BorderRadius.circular(20),

              
            ),

            child: Row(
              //Hijos del contenedor 
              children: [

                    Icon(
                      Icons.person,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      size: 100,
                      ),
                      //Hijo 2

                //Hijo 2 Column
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  //Hijos del contenedo
                  children: [
                    Row(
                      children: [
                        SizedBox(height: 20,),
                        Text(
                          'JUAN PEREZ',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    //Hijo 1
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          size: 20,
                        ),
                        Text(
                          'juanpaa@gmail.com',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          size: 20,
                        ),
                        Text(
                          '300123456',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          size: 20,
                        ),
                        Text(
                          '300123456',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          size: 20,
                        ),
                        Text(
                          'Bogota',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
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