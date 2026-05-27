import 'package:flutter/material.dart';

class Inputs extends StatelessWidget {
  const Inputs({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFormulario(),
    );
  }

}
class MyFormulario extends StatefulWidget {
  const MyFormulario({super.key});

  @override
  State<MyFormulario> createState() => _MyFormularioState();
}

class _MyFormularioState extends State<MyFormulario> {
//KEY formulario
  final _formKey =GlobalKey<FormState>();
//Controllers
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final phoneController = TextEditingController();
  

//variables del sistema
String rol = 'Usuario';
DateTime? fechaNacimiento; // el ? es para que el sistema sepa que puede estar en vacio 


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Inputs')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Escribe tu nombre',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  hintText: 'Escribe tu apellido',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.account_circle),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Correo Electronico',
                  hintText: 'Escribe el correo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              
              SizedBox(height: 16),
              DropdownButtonFormField(
                value: rol,
                decoration:  const InputDecoration(
                  labelText: 'Rol',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Usuario',
                    child: Text('Usuario'),
                  ),
                  DropdownMenuItem(
                    value: 'Administrador',
                    child: Text('admin'),
                  ),
                  DropdownMenuItem(
                    value: 'Cliente',
                    child: Text('Cliente'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    rol =value!;
                  });
                }
              ),
              SizedBox(height: 20),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.calendar_month),
                label: Text(
                  fechaNacimiento == null
                  ? 'Seleccionar fecha de nacimiento'
                  : 'Fecha: ${fechaNacimiento!.day}/${fechaNacimiento!.month}/${fechaNacimiento!.year}',
                  ),
                  onPressed: () async{
                    DateTime? fecha = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2027),
                      initialEntryMode: DatePickerEntryMode.input,
                    );
                    if(fecha != null){
                      setState(() {
                        fechaNacimiento = fecha;
                      });
                    }
                  },
              )
            ) 

            ],
          ),
          ),
        ),
      ),
    );
  }
}
