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


///Kuhaon ang valid move sa players. So ang function mag ask sa player hantud ma valid ang move nga iyang e enter.
///So e ask jud ug balik balik ang players hantud ma valid ang iyang gi input nga move.
String kuha_Move(String playerNgalan) {
  String? move;

  do {
    stdout.write(
        '$playerNgalan, enter your move (rock/paper/scissors): ');
    String? input = stdin.readLineSync();

    move = validate_lihok(input);

    if (move == null) {
      print('Invalid move. Please type rock, paper, or scissors.');
    }
  } while (move == null);

  return move;
}

///Diria is mag decides kung kinsa ang winner diria nga round.
///Then ang winner nga pangalan e return, or ma empty sya kung draw or tie.
String? decideDaog(
    String lihok1, String lihok2, String playerUna, String playerDuha) {
  if (lihok1 == lihok2) {
    return null;
  }

  if ((lihok1 == 'rock' && lihok2 == 'scissors') ||
      (lihok1 == 'paper' && lihok2 == 'rock') ||
      (lihok1 == 'scissors' && lihok2 == 'paper')) {
    return playerUna;
  }

  return playerDuha;
}

///Diria ang main function sa game
///So mag ask diria ug pangalan sa players, then mag loop diria sa game hangtud maka decides ang players nga dili na sya mo duha utro. 
void main() {
  print('===== ROCK, PAPER, SCISSORS =====');

  String playerUna = kuha_player('Player 1');
  String playerDuha = kuha_player('Player 2');

  int player1Score = 0;
  int player2Score = 0;
  int roundNumber = 1;

  String playAgain;

  do {
    print('\n--- Round $roundNumber ---');

    String playerUnaMove = kuha_Move(playerUna);

    // Print about 30 blank lines to hide Player 1's move
    for (int i = 0; i < 30; i++) {
      print('');
    }

    String playerDuhaMove = kuha_Move(playerDuha);

    print(
        '\n$playerUna chose $playerUnaMove. $playerDuha chose $playerDuhaMove.');

    String? winner = decideDaog(
      playerUnaMove,
      playerDuhaMove,
      playerUna,
      playerDuha,
    );

    if (winner == playerUna) {
      player1Score++;
      print('Result: $winner wins the round!');
    } else if (winner == playerDuha) {
      player2Score++;
      print('Result: $winner wins the round!');
    } else {
      print('Result: ${winner ?? "It\'s a draw!"}');
    }

    print(
        'Score -> $playerUna: $player1Score | $playerDuha: $player2Score');

    stdout.write('Play again? (y/n): ');
    String? tubag = stdin.readLineSync();
    playAgain = (tubag ?? 'n').trim().toLowerCase();

    roundNumber++;
  } while (playAgain == 'y');

  print('\n===== FINAL SCORE =====');
  print(
      '$playerUna: $player1Score | $playerDuha: $player2Score');

  if (player1Score > player2Score) {
    print('Overall winner: $playerUna');
  } else if (player2Score > player1Score) {
    print('Overall winner: $playerDuha');
  } else {
    print('Overall winner: Draw');
  }
}