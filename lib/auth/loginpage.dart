import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:localdatatodu/bottomnav.dart';
import 'package:localdatatodu/pages/home/creattask.dart';
import 'package:localdatatodu/service/controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailctr = TextEditingController();
  final passwordctr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 20,
          ),
          child: Column(
            children: [
              const Text(
                'Welcome Back!',
              ),
              const Text(
                'Your work faster and structured with Todyapp',
              ),
              const Gap(26),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email Address',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: emailctr,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                   const Gap(20), 
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: passwordctr,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 70,
          child: ElevatedButton(
            onPressed: () async {
              User? user;
              user = await AuthService.userLogin(
                  context, emailctr.text, passwordctr.text);
              if (user != null) {
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contex) => const BottomNav(),
                  ),
                );
              } else {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid username or password'),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: const Color(0xFF24A19C),
            ),
            child: const Lefttext(text: 'Next'),
          ),
        ),
      ),
    );
  }
}
