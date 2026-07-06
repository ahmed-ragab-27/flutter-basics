import 'package:flutter/material.dart';
import 'package:flutter_c19/utils/colors/app_colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  const AppScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.lightBlue, AppColors.blue], begin: AlignmentGeometry.topCenter, end: AlignmentGeometry.bottomCenter)
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: body,
        ),
      ),
    );
  }
}
