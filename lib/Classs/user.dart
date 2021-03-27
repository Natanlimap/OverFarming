import 'package:farmclick/Classs/farm.dart';
import 'package:farmclick/Classs/farmer.dart';

class User {
  int level;
  int totalExperience;
  int currentExperience;
  int experiencePerFood;
  int currentLife;
  int life;
  int money;
  int moneyPerFood;

  Farm farm;

  User() {
    level = 1;
    totalExperience = 100;
    currentExperience = 0;
    experiencePerFood = 0;
    currentLife = 100;
    life = 100;
    money = 10000;
    moneyPerFood = 0;

    farm = new Farm();
  }
}
