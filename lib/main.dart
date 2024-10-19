import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tarea01/firebase_options.dart';
import 'package:tarea01/modules/auth/screens/create_account.dart';
import 'package:tarea01/modules/auth/screens/login.dart';
import 'package:tarea01/navigation/changePassword.dart';
import 'package:tarea01/navigation/emailRecovery.dart';
import 'package:tarea01/navigation/profile.dart';
import 'package:tarea01/navigation/verificationForm.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/profile':(context)=>const Profile(),
        '/register':(context)=>const CreateAccount(),
      },
    );
  }
}
