import 'dart:io';

///Una kuhaon ang pangalan s mga players
///pag empty or walay sulod ang input diri, e default name ang gamiton.
String kuha_player(String Adefault_Name) {
  stdout.write('Enter $Adefault_Name name: ');
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print('(No name entered. Using "$Adefault_Name".)');
    return Adefault_Name;
  }

  return input.trim();
}

///E validate ang mga moves sa gi enter sa players. So ang valid moves kay rock, paper, or scissors ra.
///ang lowercase version sa valid move ang e return, kung dili valid ma empty ang e return.
String? validate_lihok(String? move) {
  List<String> validlihok = ['rock', 'paper', 'scissors'];

  String cleanedlihok = (move ?? '').trim().toLowerCase();

  if (validlihok.contains(cleanedlihok)) {
    return cleanedlihok;
  }

  return null;
}