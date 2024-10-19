import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      // body: SingleChildScrollView(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
               onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // Redirigir a la pantalla de inicio de sesión
                Navigator.pushReplacementNamed(context, '/login');
              },
                child: Text('Cerrar sesion')),
          ),
        ],
      ),
    );
  }
}
