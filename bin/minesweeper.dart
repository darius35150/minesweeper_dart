import 'game.dart';
import 'dart:io';

void main(List<String> arguments) {
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

  var game = Game(rows, columns, bombs);

  while (!game.gameOver) {
    print('Please enter row square you want to flip:   ');
    flipperRowString = stdin.readLineSync();
    flipperRow = int.parse(flipperRowString!);

    print('Which column square do you want to flip:   ');
    flipperColumnString = stdin.readLineSync();
    flipperColumn = int.parse(flipperColumnString!);

    game.playMove(flipperRow, flipperColumn);
  }
}
