import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/login.png',
                  width: 200,
                  height: 200,
                ),
                TextFormField(
                  validator: validateEmail,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Correo Electronico',
                    label: Text('Correo Electronico'),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  obscureText: _isObscure,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    label: const Text('Contraseña'),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off)),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 64,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(
                            'Datos -> ${_emailController.text} ${_passwordController.text}');
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24))),
                    child: const Text('Iniciar Sesion'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/email');
                  },
                  child: const Text('Repetir contraseña'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
