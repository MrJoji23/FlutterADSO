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
  final _formKey = GlobalKey<FormState>();
  //Controllers
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //variables del sistema
  String rol = 'Usuario';
  DateTime?
  fechaNacimiento; // el ? es para que el sistema sepa que puede estar en vacio
  bool acceptaTerminos = false;
  bool notificaciones = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input form')),
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
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo Electronico',
                  hintText: 'Escribe el correo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Por favor, ingresa tu correo';
                  } else if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Por favor, ingresa un correo valido';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),
              DropdownButtonFormField(
                value: rol,
                decoration: const InputDecoration(
                  labelText: 'Rol',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'Usuario', child: Text('Usuario')),
                  DropdownMenuItem(
                    value: 'Administrador',
                    child: Text('admin'),
                  ),
                  DropdownMenuItem(value: 'Cliente', child: Text('Cliente')),
                ],
                onChanged: (value) {
                  setState(() {
                    rol = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: true,

                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.calendar_month),
                    label: Text(
                      fechaNacimiento == null
                          ? 'Seleccionar fecha de nacimiento'
                          : 'Fecha: ${fechaNacimiento!.day}/${fechaNacimiento!.month}/${fechaNacimiento!.year}',
                    ),
                    onPressed: () async {
                      DateTime? fecha = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2027),
                        initialEntryMode: DatePickerEntryMode.input,
                      );
                      if (fecha != null) {
                        setState(() {
                          fechaNacimiento = fecha;
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                title: const Text('Acepto termino y condiciones'),
                value: acceptaTerminos,
                onChanged: (value) {
                  setState(() {
                    acceptaTerminos = value!;
                  });
                },
              ),

              SizedBox(height: 20),
              SwitchListTile(
                title: const Text('Recibir notis'),
                value: notificaciones,
                onChanged: (value) {
                  setState(() {
                    notificaciones = value;
                  });
                },
              ),

              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && acceptaTerminos) {
                      print('formulario registro melo');
                    } else {
                      print("Por favor, acepeta terminos unu");
                    }
                  },
                  child: const Text('Registrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
