// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsumerController on ConsumerControllerBase, Store {
  final _$consumerTimeAtom = Atom(name: 'ConsumerControllerBase.consumerTime');

  @override
  int get consumerTime {
    _$consumerTimeAtom.reportRead();
    return super.consumerTime;
  }

  @override
  set consumerTime(int value) {
    _$consumerTimeAtom.reportWrite(value, super.consumerTime, () {
      super.consumerTime = value;
    });
  }

  final _$consumerQuantityAtom =
      Atom(name: 'ConsumerControllerBase.consumerQuantity');

  @override
  int get consumerQuantity {
    _$consumerQuantityAtom.reportRead();
    return super.consumerQuantity;
  }

  @override
  set consumerQuantity(int value) {
    _$consumerQuantityAtom.reportWrite(value, super.consumerQuantity, () {
      super.consumerQuantity = value;
    });
  }

  final _$quantityAtom = Atom(name: 'ConsumerControllerBase.quantity');

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$ConsumerControllerBaseActionController =
      ActionController(name: 'ConsumerControllerBase');

  @override
  dynamic increaseQuantity() {
    final _$actionInfo = _$ConsumerControllerBaseActionController.startAction(
        name: 'ConsumerControllerBase.increaseQuantity');
    try {
      return super.increaseQuantity();
    } finally {
      _$ConsumerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decreaseQuantity() {
    final _$actionInfo = _$ConsumerControllerBaseActionController.startAction(
        name: 'ConsumerControllerBase.decreaseQuantity');
    try {
      return super.decreaseQuantity();
    } finally {
      _$ConsumerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
consumerTime: ${consumerTime},
consumerQuantity: ${consumerQuantity},
quantity: ${quantity}
    ''';
  }
}
