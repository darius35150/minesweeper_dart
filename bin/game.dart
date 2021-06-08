import 'board.dart';
import 'dart:io';

class Game {
  var _board;
  bool gameOver = false;
  String? yesOrNo = 'y';

  Game(numberOfRows, numberOfColumns, numberOfBombs) {
    _board = Board(numberOfRows, numberOfColumns, numberOfBombs);
    _board.printIt();
  }

  void playMove(rowIndex, columnIndex) {
    _board.flipTile(rowIndex, columnIndex);

    if (_board.playerBoard[rowIndex][columnIndex] == 'B') {
      print('Boom!  Game Over!');
      _board.printIt();
      print('Would you like to play again?!?! (y or n):  ');

      yesOrNo = stdin.readLineSync();
      print(yesOrNo);
      if (yesOrNo == 'y') {
        gameOver = false;
        restartGame();
      } else {
        gameOver = true;
        exit(0);
      }
    } else if (!_board.hasSafeTiles()) {
      print('Congratulations.......You have won!');

      _board.printIt();

      print('Would you like to play again?!?! (y or n):  ');

      yesOrNo = stdin.readLineSync();
      print(yesOrNo);
      if (yesOrNo == 'y') {
        gameOver = false;
        restartGame();
      } else {
        gameOver = true;
        exit(0);
      }
    } else {
      print('Current Board:');
      _board.printIt();
      gameOver = false;
    }
  }

  void restartGame() {
    var rows = 0;
    var columns = 0;
    var bombs = 0;
    var flipperRow = 0;
    var flipperColumn = 0;

    String? rowsString = '';
    String? columnsString = '';
    String? bombsString = '';
    String? flipperRowString = '';
    String? flipperColumnString = '';

    print('How may rows ?  ');
    rowsString = stdin.readLineSync();
    rows = int.parse(rowsString!);

    print('How may columns ?  ');
    columnsString = stdin.readLineSync();
    columns = int.parse(columnsString!);

    print('How may bombs ?  ');
    bombsString = stdin.readLineSync();
    bombs = int.parse(bombsString!);

    var newGame = Game(rows, columns, bombs);

    while (!newGame.gameOver) {
      print('Please enter row square you want to flip:   ');
      flipperRowString = stdin.readLineSync();
      flipperRow = int.parse(flipperRowString!);

      print('Which column square do you want to flip:   ');
      flipperColumnString = stdin.readLineSync();
      flipperColumn = int.parse(flipperColumnString!);

      newGame.playMove(flipperRow, flipperColumn);
    }
  }
}
