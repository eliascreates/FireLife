import 'package:flutter/material.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Expanded(child: Divider(thickness: 2)),
              Text(' Continue With '),
              Expanded(child: Divider(thickness: 2)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(20),
                splashFactory: InkSplash.splashFactory,
                onTap: () => print('yes sir'),
                child: Image.asset(
                  'assets/facebook.png',
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                splashFactory: InkSplash.splashFactory,
                onTap: () => print('yes sir'),
                child: Image.asset(
                  'assets/google.png',
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('already have an account?'),
              TextButton(
                  onPressed: () => print('yes sir'), child: Text('Sign Up'))
            ],
          )
        ],
      ),
    );
  }
}
