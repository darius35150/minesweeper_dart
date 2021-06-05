import 'board.dart';

class Game {
  var _board;
  bool gameOver = false;

  Game(numberOfRows, numberOfColumns, numberOfBombs) {
    _board = Board(numberOfRows, numberOfColumns, numberOfBombs);
    _board.printIt();
  }

  void playMove(rowIndex, columnIndex) {
    _board.flipTile(rowIndex, columnIndex);

    if (_board.playerBoard[rowIndex][columnIndex] == 'B') {
      print('Boom!  Game Over!');
      _board.printIt();
      gameOver = true;
    } else if (!_board.hasSafeTiles()) {
      print('Congratulations.......You have won!');
      _board.printIt();
      gameOver = true;
    } else {
      print('Current Board:');
      _board.printIt();
      gameOver = false;
    }
  }
}
