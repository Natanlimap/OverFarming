import 'package:mobx/mobx.dart';
part 'consumer_controller.g.dart';

class ConsumerController = ConsumerControllerBase with _$ConsumerController;

abstract class ConsumerControllerBase with Store {
  @observable
  int consumerTime = 1;
  @observable
  int consumerQuantity = 1;

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
