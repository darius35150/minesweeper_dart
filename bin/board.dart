import 'dart:math';

class Board {
  int _numberOfBombs = 0;
  int _numberOfTiles = 0;
  var _playerBoard;
  var _bombBoard;

  Board(int numberOfRows, int numberOfColumns, int numberOfBombs) {
    _numberOfBombs = numberOfBombs;
    _numberOfTiles = numberOfRows * numberOfColumns;
    _playerBoard = Board.generatePlayerBoard(numberOfRows, numberOfColumns);
    _bombBoard =
        Board.generateBombBoard(numberOfRows, numberOfColumns, numberOfBombs);
  }

  List<dynamic> get playerBoard {
    return _playerBoard;
  }

  void flipTile(int rowIndex, int columnIndex) {
    if (_playerBoard[rowIndex][columnIndex] != ' ') {
      print('This tile has already been flipped!');
      return;
    } else if (_bombBoard[rowIndex][columnIndex] == 'B') {
      _playerBoard[rowIndex][columnIndex] = 'B';
    } else {
      _playerBoard[rowIndex][columnIndex] =
          getNumberOfNeighborBomb(rowIndex, columnIndex);
    }
    _numberOfTiles--;
  }

  int getNumberOfNeighborBomb(rowIndex, columnIndex) {
    var neighborOffsets = <dynamic>[
      [-1, -1],
      [-1, 0],
      [0, -1],
      [0, 0],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ];

    var numberOfRows = _bombBoard.length;
    // var numberOfColumns = _bombBoard[0].length;
    var numberOfBombs = 0;
    var neighborRowIndex = 0;
    var neighborColumnIndex = 0;
    for (var i = 0; i < neighborOffsets.length; i++) {
      // neighborOffsets.forEach((offset) =>{ 
      neighborRowIndex = rowIndex + neighborOffsets[i][0];
      neighborColumnIndex = columnIndex + neighborOffsets[i][1];

      if (neighborRowIndex >= 0 &&
          neighborRowIndex < numberOfRows &&
          neighborColumnIndex >= 0 &&
          neighborColumnIndex < neighborColumnIndex) {
        if (_bombBoard[neighborRowIndex][neighborColumnIndex] == 'B') {
          numberOfBombs++;
        }
      }
    }
      // });
    return numberOfBombs;
  }

  bool hasSafeTiles() {
    return _numberOfTiles != _numberOfBombs;
  }

  void printIt() {
    print(_playerBoard.map((row) => row.join(' | ')).join('\n'));
  }

  static List<dynamic> generatePlayerBoard(numberOfRows, numberOfColumns) {
    var board = [];

    for (var i = 0; i < numberOfRows; i++) {
      var row = [];

      for (var j = 0; j < numberOfColumns; j++) {
        row.add(' ');
      }
      board.add(row);
    }
    return board;
  }

  static List<dynamic> generateBombBoard(
      numberOfRows, numberOfColumns, numberOfBombs) {
    var board = [];

    for (var i = 0; i < numberOfRows; i++) {
      var row = [];

      for (var j = 0; j < numberOfColumns; j++) {
        row.add(null);
      }
      board.add(row);
    }

    var numberOfBombsPlaced = 0;

    while (numberOfBombsPlaced < numberOfBombs) {
      var randomRowIndex = 0;
      var randomColumnIndex = 0;
      var random = Random();
      randomRowIndex = random.nextInt(numberOfRows);
      randomColumnIndex = random.nextInt(numberOfColumns);

      if (board[randomRowIndex][randomColumnIndex] != 'B') {
        board[randomRowIndex][randomColumnIndex] = 'B';
        numberOfBombsPlaced += 1;
      }
      board[randomRowIndex][randomColumnIndex] = 'B';
      numberOfBombsPlaced += 1;
    }
    return board;
  }
}
