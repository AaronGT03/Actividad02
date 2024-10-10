import 'package:flutter/material.dart';

class EmailRecovery extends StatefulWidget {
  const EmailRecovery({super.key});

  @override
  _EmailRecoveryState createState() => _EmailRecoveryState();
}

class _EmailRecoveryState extends State<EmailRecovery> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String allowedEmail = 'ejemplo@gmail.com';
  String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    } else if (value != allowedEmail) {
      return 'Correo electrónico no registrado';
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
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailController,
                  validator: validateEmail,
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    hintText: 'correo electrónico',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Acceso Permitido'),
                            content: Text(
                                'El correo ${_emailController.text} es válido. Se envió un código de verificación.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/verification');
                                },
                                child: const Text('Aceptar'),
                              )
                            ],
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.grey),
                      padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 16.0)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                    ),
                    child: const Text('Enviar código'),
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
