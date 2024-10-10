import 'package:flutter/material.dart';
import 'package:tarea01/modules/auth/screens/login.dart';
import 'package:tarea01/navigation/changePassword.dart';
import 'package:tarea01/navigation/emailRecovery.dart';
import 'package:tarea01/navigation/verificationForm.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login':(context)=>const Login(),
        '/email':(context)=>const EmailRecovery(),
        '/verification':(context)=>const VerificationForm(),
        '/password':(context)=>const ChangePassword(),
      },
    );
  }
}
