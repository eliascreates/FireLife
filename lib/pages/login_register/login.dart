import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../components/alt_logins.dart';
import '../../components/start_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isOn = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 60),
              Text('Welcome\nTo Percy Jackson',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.shanti(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  )),
              const SizedBox(height: 40),
              const Text("The only place you can't leave without being fined"),
              const SizedBox(height: 40),
              NewTextField(
                  placeholderText: 'Email', controller: _emailController),
              const SizedBox(height: 20),
              NewTextField(
                placeholderText: 'Password',
                controller: _passwordController,
                isOn: _isOn,
                endIcon: InkWell(
                  onTap: () => setState(() {
                    _isOn = !_isOn;
                  }),
                  splashColor: Colors.transparent,
                  child: Icon(
                      _isOn
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.grey[800]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => print('password remebered'),
                    child: const Text(
                      'forgot password?',
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.maxFinite,
                child: SizedBox(
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ElevatedButton(
                        onPressed: signIn, child: const Text('Sign In')),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const LoginOptions(),
            ],
          ),
        ),
      ),
    );
  }
}
