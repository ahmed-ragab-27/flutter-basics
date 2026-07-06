import 'package:flutter/material.dart';
import 'package:flutter_c19/sessions/screens/calculator/calculator_btn.dart';
import 'package:flutter_c19/utils/colors/app_colors.dart';
import 'package:flutter_c19/utils/styles/app_styles.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = 'calculator';

  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    textAlign: TextAlign.end,
                    result,
                    style: AppStyles.white48Medium,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    spacing: 22,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      CalculatorBtn(
                                        'Ac',
                                        onClearClick,
                                        backgroundColor: AppColors.lightGray,
                                        textColor: AppColors.white,
                                      ),
                                      CalculatorBtn('7', onDigitClick),
                                      CalculatorBtn('4', onDigitClick),
                                      CalculatorBtn('1', onDigitClick),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    spacing: 22,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      CalculatorBtn(
                                        'x',
                                        onDeleteClick,
                                        backgroundColor: AppColors.lightGray,
                                        textColor: AppColors.white,
                                      ),
                                      CalculatorBtn('8', onDigitClick),
                                      CalculatorBtn('5', onDigitClick),
                                      CalculatorBtn('2', onDigitClick),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    spacing: 22,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      CalculatorBtn(
                                        '/',
                                        onOperatorClick,
                                        backgroundColor: AppColors.darkBlue,
                                        textColor: AppColors.white,
                                      ),
                                      CalculatorBtn('9', onDigitClick),
                                      CalculatorBtn('6', onDigitClick),
                                      CalculatorBtn('3', onDigitClick),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(top: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CalculatorBtn('0', onDigitClick, flex: 2),
                                  CalculatorBtn('.', onDigitClick),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        spacing: 22,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CalculatorBtn(
                            '*',
                            onOperatorClick,
                            backgroundColor: AppColors.darkBlue,
                            textColor: AppColors.white,
                            flex: 25,
                          ),
                          CalculatorBtn(
                            '-',
                            onOperatorClick,
                            backgroundColor: AppColors.darkBlue,
                            textColor: AppColors.white,
                            flex: 25,
                          ),
                          CalculatorBtn(
                            '+',
                            onOperatorClick,
                            backgroundColor: AppColors.darkBlue,
                            textColor: AppColors.white,
                            flex: 40,
                          ),
                          CalculatorBtn(
                            '=',
                            onEqualClick,
                            backgroundColor: AppColors.darkBlue,
                            textColor: AppColors.white,
                            flex: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDigitClick(String digit) {
    if (result.contains('.') && digit == '.') {
      return;
    }
    result += digit;
    setState(() {});
  }

  String lhs = '';
  String savedOperator = '';

  void onOperatorClick(String operator) {
    if (result.isEmpty) {
      return;
    }
    if (savedOperator.isEmpty) {
      lhs = result;
    } else {
      lhs = calculate(lhs, savedOperator, result);
    }

    savedOperator = operator;
    result = '';
    setState(() {});
    print('lhs = $lhs, savedOperator = ${savedOperator}');
  }

  void onEqualClick(String operator) {
    if (result.isEmpty || savedOperator.isEmpty) {
      return;
    }
    result = calculate(lhs, savedOperator, result);
    lhs = '';
    savedOperator = '';
    setState(() {});
  }

  void onClearClick(String operator) {
    result = '';
    lhs = '';
    savedOperator = '';
    setState(() {});
  }

  void onDeleteClick(String operator) {
    setState(() {
      if (result.isNotEmpty) {
        result = result.substring(0, result.length - 1);
      }
    });
  }

  String calculate(String lhs, String operator, String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    if (operator == '+') {
      return '${n1 + n2}';
    } else if (operator == '-') {
      return '${n1 - n2}';
    } else if (operator == '/') {
      return '${n1 / n2}';
    } else {
      return '${n1 * n2}';
    }
  }
}
