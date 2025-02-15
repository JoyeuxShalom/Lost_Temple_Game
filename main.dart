import 'dart:io';

void main() {
  int health = 100;
  int relics = 0;
  List<int> visitedRooms = [];
  int maxMoves = 6;
  int currentMove = 0;

  while (health > 0 && relics < 3 && currentMove < maxMoves) {
    print(
      '\nHealth: $health | Relics: $relics | Moves left: ${maxMoves - currentMove}',
    );

    print('Which room do you want enter? (1-6)');
    String? input = stdin.readLineSync();
    int room = int.tryParse(input ?? '') ?? 0;

    if (room < 1 || room > 6) {
      print("Invalid room number! Try again.");
      continue;
    }

    if (visitedRooms.contains(room)) {
      print("You've already been in this room! Try another room.");
      continue;
    }

    visitedRooms.add(room);
    currentMove++;

    switch (room) {
      case 1:
        print(
          "Room of Echoes: Solve the riddle. Reverse the string 'dart'. What do you get?",
        );
        String? answer = stdin.readLineSync();
        if (answer != "trad") {
          health -= 20;
          print("Incorrect! You lost 20 health.");
        } else {
          relics++;
          print("Correct! You found a relic.");
        }
        break;

      case 2:
        print("Pit of Arithmetic: Solve the equation (5 * 4) ~/ 2.");
        String? mathAnswer = stdin.readLineSync();
        if (int.tryParse(mathAnswer ?? '') != 10) {
          health -= 20;
          print("Incorrect! You lost 20 health.");
        } else {
          relics++;
          print("Correct! You found a relic.");
        }
        break;

      case 3:
        print("Mirror Chamber: Is [1,2,3] the same as its reverse?");
        String? listAnswer = stdin.readLineSync();
        if (listAnswer != "no") {
          health -= 20;
          print("Incorrect! You lost 20 health.");
        } else {
          relics++;
          print("Correct! You found a relic.");
        }
        break;

      case 4:
        print(
          "Treasure vault: You have a key, but the vault is locked. Is the vault open if isLocked = true and haskey = true?",
        );
        String? logicAnswer = stdin.readLineSync();
        if (logicAnswer != "true") {
          health -= 20;
          print("Incorrect! You lost 20 health.");
        } else {
          relics++;
          print("Correct! You find a relic.");
        }
        break;

      case 5:
        print(
          "Hall of Shadows: What is always in front of you but can't be seen?",
        );
        String? riddleAnswer = stdin.readLineSync();
        if (riddleAnswer != "future") {
          health -= 20;
          print("Incorrect! You lost 20 health.");
        } else {
          relics++;
          print("Correct! You found a relic.");
        }
        break;

      case 6:
        print("Final Room: What is the sum of the numbers 1, 2, and 3?");
        String? finalAnswer = stdin.readLineSync();
        if (int.tryParse(finalAnswer ?? '') != 6) {
          health -= 20;
          print("Incorrect! You lost 20 health.");
        } else {
          relics++;
          print("Correct! You found the relic.");
        }
        break;

      default:
        print("Invalid room choice! Please select a valid room.");
    }

    if (relics == 3) {
      print(
        "\nCongratulations! You've collected all 3 relics and won the game!",
      );
      break;
    } else if (health <= 0) {
      print("\nGam Over! Your health reached 0. You lost!");
      break;
    }
  }

  if (currentMove == maxMoves && relics < 3) {
    print(
      "\nGame Over! You've used all your moves without collecting all relics.",
    );
  }
}
