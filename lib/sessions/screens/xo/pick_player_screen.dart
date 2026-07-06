import 'package:flutter/material.dart';
import 'package:flutter_c19/sessions/screens/xo/xo_screen.dart';
import 'package:flutter_c19/utils/app_constants.dart';
import 'package:flutter_c19/utils/colors/app_colors.dart';
import 'package:flutter_c19/utils/images/app_images.dart';
import 'package:flutter_c19/utils/styles/app_styles.dart';
import 'package:flutter_c19/widgets/app_scaffold.dart';

class PickPlayerScreen extends StatelessWidget {
  static const String routeName = 'pickPlayer';

  const PickPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.backgroundXo),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text('Tix-Tac-Toe', style: AppStyles.white40Bold),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Spacer(),
                Text('Pick who goes first?', style: AppStyles.white24Medium),
                SizedBox(height: 16,),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      SizedBox(width: 16,),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, XoScreen.routeName, arguments: AppConstants.x);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Image.asset(AppImages.xImage),
                          ),
                        ),
                      ),
                      SizedBox(width: 16,),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, XoScreen.routeName, arguments: AppConstants.o);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Image.asset(AppImages.oImage),
                          ),
                        ),
                      ),
                      SizedBox(width: 16,),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

