import 'dart:math';

class DiceRoller {
    DiceRoller() {}

    int roll(int size) {
      return Random().nextInt(size) + 1;
    }
}