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
    return Scaffold	(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Dark.jpeg'),
            fit: BoxFit.cover
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
              ]else ...[
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isRegistering = true;
                        });
                      },
                      child: const Text(
                        'Registrate',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                        
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
                          ),),
                        
                        ), 
                  ],
                ),
              const SizedBox(
                height: 30,
              ),
              if (_isRegistering) ...[
                _signUpForm(),
              ]else ...[
                _signInForm()
              ],            
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _signUpForm() {
    return Column(
      children: [
        Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30.0
              ),
              child: TextFormField(
                controller: _nameController,
                decoration:  InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Joshua Dorante',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  prefixIcon: const Icon(Icons.person_outline)
                ),
                validator: (value)  {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu nombre';
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(
              height: 15,
            ),


            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30.0
              ),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'example@example.com',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
              validator: (value) {
                if (value == null || !value.contains('@')) {
                  return 'Por favor, ingrese un email válido';
                }
                return null;
              },
                        ),
            ),

            const SizedBox(
              height: 15,
            ),

          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 30.0
              ),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                fillColor: Colors.white,
                filled: true,
                hintText: '******',
                prefixIcon: const Icon(Icons.lock_outlined),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
              ),
              validator: (value) {
                if (value == null || value.length < 6 ) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                }
                return null;
              },
              
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          _buttonSignUp(),
      ],
    );
  }

  Widget _signInForm () {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          child: TextFormField(
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
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          child: TextFormField(
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
        ),
        const SizedBox(
          height: 20,
        ),
        _buttonSignIn()
      ],
    );
  }

  Widget _buttonSignIn () {
    return InkWell(
      onTap:  () {},
      child: Container(
        width: 280,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xff2f2f44),
          borderRadius: BorderRadius.circular(30)
        ),
        child: const Center(
          child: Text(
            'Iniciar Sesión',
            
            style: TextStyle(
              
              backgroundColor: Color(0xff2f2f44),
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            ),
        ),
      ),
    );
  }

  Widget _buttonSignUp() {
    return InkWell(
      onTap: () {

      }, 
      child: Container(
        width: 280,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xff2f2f44),
          borderRadius: BorderRadius.circular(30)
        ),
        child: const Center(
          child: Text(
            'Registrarme',
            
            style: TextStyle(
              
              backgroundColor: Color(0xff2f2f44),
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            ),
        ),
      ),
        );


  }
}

