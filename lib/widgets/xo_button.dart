import 'package:flutter/material.dart';
import 'package:flutter_c19/utils/app_constants.dart';
import 'package:flutter_c19/utils/images/app_images.dart';

class XoButton extends StatelessWidget {
  final String symbol;
  final Function onClick;
  final int index;

  const XoButton({super.key, required this.symbol, required this.onClick, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onClick(index),
        child: symbol.isEmpty
            ? SizedBox(width: double.infinity, height: double.infinity,)
            : Image.asset(
          symbol == AppConstants.x ? AppImages.xImage : AppImages.oImage,
        ),
      )
    );
  }
}
