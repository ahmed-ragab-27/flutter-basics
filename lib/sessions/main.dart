import 'package:flutter/material.dart';
import 'package:flutter_c19/sessions/screens/calculator/calculator_screen.dart';
import 'package:flutter_c19/sessions/screens/home/home_screen.dart';
import 'package:flutter_c19/sessions/screens/login/login_screen.dart';
import 'package:flutter_c19/sessions/screens/register/register_screen.dart';
import 'package:flutter_c19/sessions/screens/xo/pick_player_screen.dart';
import 'package:flutter_c19/sessions/screens/xo/xo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PickPlayerScreen.routeName,
      routes: {
        LoginScreen.routeName : (BuildContext context) => LoginScreen(),
        RegisterScreen.routeName : (BuildContext context) => RegisterScreen(),
        HomeScreen.routeName : (_) => HomeScreen(),
        CalculatorScreen.routeName : (context) => CalculatorScreen(),
        XoScreen.routeName : (_) => XoScreen(),
        PickPlayerScreen.routeName : (context) => PickPlayerScreen(),
      },
    );
  }
}

/// init : Create empty git repo
/// commit: save changes in your project
/// reset: Move branch to other commit
/// revet: New commit with reverted changes
/// merge: move commits from one branch to another
/// checkout: changes view of the current branch
/// push: upload current branch to remote repo