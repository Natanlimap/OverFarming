import 'dart:async';
import 'dart:math';

import 'package:farmclick/Controller/consumer_controller.dart';
import 'package:mobx/mobx.dart';

import 'farmer_controller.dart';
part "game_controller.g.dart";

class GameController = GameControllerBase with _$GameController;

abstract class GameControllerBase with Store {
  @observable
  ConsumerController consumer_controller = new ConsumerController();

  @observable
  FarmerController farmer_controller = new FarmerController();

  @observable
  int level = 1;

  @observable
  int life = 100;

  @observable
  int maxLife = 100;

  @observable
  int currentExperience = 0;

  @observable
  int maxExperience = 100;

  @observable
  int maxStorage = 100;

  @observable
  int currentStorage = 0;

  @observable
  double money = 1000;

  @observable
  double pricePerFood = 2;

  @observable
  int costPerFarmer = 100;

  @observable
  int costPerConsumer = 100;

  @observable
  double farmerHappiness = 1.0;

  @observable
  double consumerHappiness = 1.0;

  @observable
  double experienceFoodWhenOne = 0;

  @observable
  double foodExperience = 0.2;

  @action
  increaseMoney(int value) {
    money += value;
  }

  @action
  bool buy(int value) {
    if (money > value) {
      money -= value;
      return true;
    } else {
      return false;
    }
  }

  @action
  sell(double value) {
    money += value;
  }

  @action
  increaseFarmer() {
    if (buy(costPerFarmer)) farmer_controller.increaseQuantity();
    costPerFarmer += 50;
  }

  @action
  increaseConsumer() {
    if (buy(costPerConsumer)) consumer_controller.increaseQuantity();
    costPerConsumer += 50;
  }

  @action
  decreaseFarmer() {
    if (farmer_controller.quantity > 1) {
      farmer_controller.decreaseQuantity();
      sell(costPerFarmer * 0.4);
    }
  }

  @action
  decreaseConsumer() {
    if (consumer_controller.quantity > 1) {
      consumer_controller.decreaseQuantity();
      sell(costPerConsumer * 0.4);
    }
  }

  @action
  mustLevelUp() {
    level++;
    currentExperience = 0;
    maxExperience = maxExperience + 100;
  }

  @action
  mustIncreaseXp(int quantity) {
    if (currentExperience < maxExperience - 1 * quantity) {
      currentExperience += 1 * quantity;
    } else {
      mustLevelUp();
    }
  }

  @action
  decreaseConsumerHapinnes() {
    consumerHappiness *= 0.975;

    if (consumerHappiness < 0.5) {
      life--;
    }
    if (consumerHappiness < 0.2) {
      life -= 2;
    }
    if (consumerHappiness < 0.1) {
      life -= 4;
    }
    manageLife();
  }

  @action
  increaseConsumerHapinnes() {
    consumerHappiness *= 1.012;
    if (consumerHappiness > 1) {
      consumerHappiness = 1.0;
    }
    if (consumerHappiness > 0.9) {
      life++;
    }
    manageLife();
  }

  manageLife() {
    if (life < 0) {
      life = 0;
      print("PERDEU");
    }
    if (life > 100) {
      life = 100;
    }
  }

  @action
  decreaseFarmerHapinnes() {
    farmerHappiness *= 0.975;

    if (farmerHappiness < 0.5) {
      life--;
    }
    if (farmerHappiness < 0.2) {
      life -= 2;
    }
    if (farmerHappiness < 0.1) {
      life -= 4;
    }
    manageLife();
  }

  @action
  increaseFamerHapinnes() {
    farmerHappiness *= 1.012;
    if (farmerHappiness > 1) {
      farmerHappiness = 1;
    }
    if (farmerHappiness > 0.9) {
      life++;
    }
  }

  @action
  readyGame() {
    print("Começou");

    new Timer.periodic(
        //FARMER
        Duration(seconds: farmer_controller.productionTime),
        (Timer t) => {
              if (currentStorage +
                      farmer_controller.productionQuantity *
                          farmer_controller.quantity <
                  maxStorage)
                {
                  increaseFamerHapinnes(),
                  mustIncreaseXp(farmer_controller.quantity),
                  currentStorage += farmer_controller.productionQuantity *
                      farmer_controller.quantity
                }
              else
                {decreaseFarmerHapinnes()},
              if (currentStorage > maxStorage) {currentStorage = maxStorage}
            });

    //CONSUMER
    new Timer.periodic(
        Duration(seconds: consumer_controller.consumerTime),
        (Timer t) => {
              // Pode consumir
              if (currentStorage -
                      consumer_controller.consumerQuantity *
                          consumer_controller.quantity >
                  0)
                {
                  increaseConsumerHapinnes(),
                  mustIncreaseXp(consumer_controller.quantity),
                  currentStorage -= consumer_controller.consumerQuantity *
                      consumer_controller.quantity,
                  increaseMoney(consumer_controller.consumerQuantity *
                      consumer_controller.quantity)
                }
              else
                {decreaseConsumerHapinnes()},
              //Não pode consumiu
              if (currentStorage < 0) {currentStorage = 0}
            });
  }
}

class async {}
