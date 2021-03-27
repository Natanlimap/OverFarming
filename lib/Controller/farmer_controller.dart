import 'package:mobx/mobx.dart';
part 'farmer_controller.g.dart';

class FarmerController = FarmerControllerBase with _$FarmerController;

abstract class FarmerControllerBase with Store {
  @observable
  int productionTime = 1;
  @observable
  int productionQuantity = 2;

  @observable
  int quantity = 1;

  @action
  increaseQuantity() {
    quantity += 1;
  }

  @action
  decreaseQuantity() {
    quantity -= 1;
  }
}
