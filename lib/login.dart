import 'package:flutter/material.dart';
import 'package:primerproyecto/input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usuarioController = TextEditingController();
  final passwordController = TextEditingController();
  bool ocultarPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FB),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                const SizedBox(height: 40),

                //Container(
                //  width: 140,
                //  height: 140,
                //
                //  decoration: BoxDecoration(
                //    color: Color(0xFFc5c5c5),
                //
                //    borderRadius: BorderRadius.circular(70),
                //  ),
                //
                //  child: ClipRRect(
                //    borderRadius: BorderRadius.circular(70),
                //    child: Image.asset(
                //      "assets/images/photobogotaimg.jfif",
                //      fit: BoxFit.cover,
                //    ),
                //  ),
                //),

                const SizedBox(height: 20),

                const Text(
                  "Accede a tu cuenta",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Color(0xFF806FBE)),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Photo Bogotá",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0a0a0a),
                  ),
                ),

                const SizedBox(height: 20),

                Card(
                  elevation: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          controller: usuarioController,
                          decoration: InputDecoration(
                            labelText: "Usuario o correo",
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        TextField(
                          controller: passwordController,
                          obscureText: ocultarPassword,
                          decoration: InputDecoration(
                            labelText: "Contraseña",
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                ocultarPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  ocultarPassword = !ocultarPassword;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              print("Usuario: ${usuarioController.text}");
                              print("Password: ${passwordController.text}");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF806fbe),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              "Ingresar →",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),
                Divider(color: Colors.grey[300], thickness: 1),
                const SizedBox(height: 25),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyFormulario(),
                      ),
                    );
                  },
                  child: const Text(
                    "¿Eres nuevo en Photo Bogotá? Crear cuenta",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF806fbe),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}