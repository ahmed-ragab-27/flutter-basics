import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_c19/utils/app_constants.dart';
import 'package:flutter_c19/utils/colors/app_colors.dart';
import 'package:flutter_c19/utils/styles/app_styles.dart';
import 'package:flutter_c19/widgets/app_scaffold.dart';
import 'package:flutter_c19/widgets/xo_button.dart';

class XoScreen extends StatefulWidget {
  static const String routeName = 'xo';

  XoScreen({super.key});

  @override
  State<XoScreen> createState() => _XoScreenState();
}

class _XoScreenState extends State<XoScreen> {
  late String firstPlayer;
  late String secondPlayer;

  @override
  Widget build(BuildContext context) {
    firstPlayer = ModalRoute.of(context)!.settings.arguments as String;
    secondPlayer = firstPlayer == AppConstants.x
        ? AppConstants.o
        : AppConstants.x;
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTimer(),
            SizedBox(height: 32),
            buildPlayerTurn(),
            SizedBox(height: 24),
            buildBoard(),
          ],
        ),
      ),
    );
  }

  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  String getFormattedTime() {
    int seconds = timer.tick;
    int min = timer.tick ~/ 60;
    seconds = seconds - min * 60;
    return '${min < 10 ? '0' : ''}$min:${seconds < 10 ? '0' : ''}$seconds';
  }

  buildTimer() => Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(44),
    ),
    padding: EdgeInsets.all(16),
    child: Text(
      getFormattedTime(),
      style: AppStyles.black32SemiBold,
      textAlign: TextAlign.center,
    ),
  );

  buildPlayerTurn() => Text(
    'Player ${counter.isEven ? '1' : '2'}’s Turn',
    style: AppStyles.white36Bold,
    textAlign: TextAlign.center,
  );

  List<String> board = ['', '', '', '', '', '', '', '', ''];
  int counter = 0;

  buildBoard() => Expanded(
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(44),
            color: AppColors.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    XoButton(
                      symbol: board[0],
                      onClick: onPlayerClick,
                      index: 0,
                    ),
                    XoButton(
                      symbol: board[1],
                      onClick: onPlayerClick,
                      index: 1,
                    ),
                    XoButton(
                      symbol: board[2],
                      onClick: onPlayerClick,
                      index: 2,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    XoButton(
                      symbol: board[3],
                      onClick: onPlayerClick,
                      index: 3,
                    ),
                    XoButton(
                      symbol: board[4],
                      onClick: onPlayerClick,
                      index: 4,
                    ),
                    XoButton(
                      symbol: board[5],
                      onClick: onPlayerClick,
                      index: 5,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    XoButton(
                      symbol: board[6],
                      onClick: onPlayerClick,
                      index: 6,
                    ),
                    XoButton(
                      symbol: board[7],
                      onClick: onPlayerClick,
                      index: 7,
                    ),
                    XoButton(
                      symbol: board[8],
                      onClick: onPlayerClick,
                      index: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Divider(
              thickness: 2,
              color: Colors.black,
              indent: 12,
              endIndent: 12,
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
              indent: 12,
              endIndent: 12,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VerticalDivider(
              thickness: 2,
              color: Colors.black,
              indent: 12,
              endIndent: 12,
            ),
            VerticalDivider(
              thickness: 2,
              color: Colors.black,
              indent: 12,
              endIndent: 12,
            ),
          ],
        ),
      ],
    ),
  );

  onPlayerClick(int index) {
    if (board[index].isNotEmpty) return;
    board[index] = counter.isEven ? firstPlayer : secondPlayer;
    if (checkWinner(board[index])) {
      resetBoard();
      return;
    }
    if (counter == 8) {
      resetBoard();
      return;
    }
    counter++;
    setState(() {});
  }

  bool checkWinner(String symbol) {
    /// rows
    for (int i = 0; i <= 6; i++) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }

    /// columns

    for (int i = 0; i <= 2; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }

    /// Diagonals
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    return false;
  }

  void resetBoard() {
    board = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

}


