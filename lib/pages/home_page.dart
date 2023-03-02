import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              'assets/summer.jfif',
              height: double.infinity, 
              fit: BoxFit.cover,
            ),
            const Positioned(
              bottom: 110,
              child: Text(
                'Welcome to Wakanda',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 80,
              child: Text(
                '${user.email}',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 20,
              child: ElevatedButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: const Text('Sign Out'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
