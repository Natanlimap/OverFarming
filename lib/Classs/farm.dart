import 'package:farmclick/Classs/consumer.dart';
import 'package:farmclick/Classs/farmer.dart';

class Farm {
  int storage;

  Consumer consumer;
  Farmer farmer;

  Farm() {
    storage = 1000;
    consumer = new Consumer();
    farmer = new Farmer();
  }
}
