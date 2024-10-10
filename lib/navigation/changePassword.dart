import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();
  bool _isObscurePassword = true;
  bool _isObscureRepeatPassword = true;

  String? _errorMessage; // Mensaje de error

  @override
  void dispose() {
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  void _validatePasswords() {
    setState(() {
      if (_passwordController.text != _repeatPasswordController.text) {
        _errorMessage = 'Las contraseñas no coinciden';
      } else {
        _errorMessage = null;
        // Si las contraseñas son iguales, redirigimos a la pantalla de login
        Navigator.pushNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagen en el centro
              Image.asset(
                'assets/login.png',  // Asegúrate de que la imagen esté correctamente incluida en pubspec.yaml
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 32),

              // Campo de contraseña
              TextField(
                controller: _passwordController,
                obscureText: _isObscurePassword,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_isObscurePassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscurePassword = !_isObscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Campo de repetir contraseña
              TextField(
                controller: _repeatPasswordController,
                obscureText: _isObscureRepeatPassword,
                decoration: InputDecoration(
                  labelText: 'Repetir contraseña',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_isObscureRepeatPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscureRepeatPassword = !_isObscureRepeatPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Mostrar error si existe
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 16),

              // Botón de Guardar
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _validatePasswords,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
