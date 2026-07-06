import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, 'register');
            }, child: Text('to register')),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, 'home');
            }, child: Text('to home')),
          ],
        ),
      ),
    );
  }
}
