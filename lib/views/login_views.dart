import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isRegistering = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textSpacing = screenWidth > 800 ? 200 : 40; // Ajusta el espaciado dinámicamente

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Dark.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isRegistering == false) ...[
                Text(
                  'Bienvenido \nNuevamente'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Spoti',
                  ),
                ),
              ] else ...[
                Text(
                  '¿No tienes\nCuenta?'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Spoti',
                  ),
                ),
              ],
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isRegistering = true;
                      });
                    },
                    child: const Text(
                      'Regístrate',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(width: textSpacing), // Espacio dinámico entre los textos
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isRegistering = false;
                      });
                    },
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              if (_isRegistering) ...[_signUpForm()] else ...[_signInForm(context)],
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpForm() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width > 600 ? 400 : double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                hintText: 'Joshua Dorante',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.person_outline),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tu nombre';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                fillColor: Colors.white,
                filled: true,
                hintText: 'example@example.com',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || !value.contains('@')) {
                  return 'Por favor, ingrese un email válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                fillColor: Colors.white,
                filled: true,
                hintText: '******',
                prefixIcon: const Icon(Icons.lock_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            _buttonSignUp(context),
          ],
        ),
      ),
    );
  }

  Widget _signInForm(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width > 600 ? 400 : double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                fillColor: Colors.white,
                filled: true,
                hintText: 'example@example.com',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || !value.contains('@')) {
                  return 'Por favor, ingrese un email válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                fillColor: Colors.white,
                filled: true,
                hintText: '******',
                prefixIcon: const Icon(Icons.lock_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            _buttonSignIn(context),
          ],
        ),
      ),
    );
  }

  Widget _buttonSignIn(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width > 600 ? 300 : 280, // Ajusta el tamaño según el ancho de la pantalla
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xff2f2f44),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(
          child: Text(
            'Iniciar Sesión',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20, // Ajusta el tamaño de fuente
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonSignUp(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width > 600 ? 300 : 280, // Ajusta el tamaño según el ancho de la pantalla
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xff2f2f44),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(
          child: Text(
            'Registrarme',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20, // Ajusta el tamaño de fuente
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
