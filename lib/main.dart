import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localdatatodu/auth/loginpage.dart';
import 'package:localdatatodu/firebase_options.dart';
//import 'package:localdatatodu/pages/home/creattask.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: BottomNav(),
      home: LoginPage(),
    );
  }
}
