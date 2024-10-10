import 'package:flutter/material.dart';

class VerificationForm extends StatefulWidget {
  const VerificationForm({super.key});

  @override
  _VerificationFormState createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  final TextEditingController _codeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String allowedCode = '12345';

  String? validateCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese el código de verificación';
    } else if (value != allowedCode) {
      return 'Código incorrecto, intente nuevamente';
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
                  controller: _codeController,
                  validator: validateCode,
                  decoration: InputDecoration(
                    labelText: 'Código de verificación',
                    hintText: 'Ingrese el código de verificación',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 24),
                
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/password');
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
                    child: const Text('Validar código'),
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
