import 'board.dart';

class Game 
{

  var _board;

  Game(numberOfRows, numberOfColumns, numberOfBombs) 
  {
    _board = Board(numberOfRows, numberOfColumns, numberOfBombs);
  }

  void playMove(rowIndex, columnIndex) 
  {

    _board.flipTile(rowIndex, columnIndex);

    if (_board.playerBoard[rowIndex][columnIndex] == 'B') {
      print('Boom!  Game Over!');
      _board.print();
    } else if (!_board.hasSafeTiles()) {
      print('Congratulations.......You have won!');
    } else {
      print('Current Board:');
      _board.printIt();
    }
  }
}