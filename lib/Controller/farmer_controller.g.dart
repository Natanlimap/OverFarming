// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FarmerController on FarmerControllerBase, Store {
  final _$productionTimeAtom =
      Atom(name: 'FarmerControllerBase.productionTime');

  @override
  int get productionTime {
    _$productionTimeAtom.reportRead();
    return super.productionTime;
  }

  @override
  set productionTime(int value) {
    _$productionTimeAtom.reportWrite(value, super.productionTime, () {
      super.productionTime = value;
    });
  }

  final _$productionQuantityAtom =
      Atom(name: 'FarmerControllerBase.productionQuantity');

  @override
  int get productionQuantity {
    _$productionQuantityAtom.reportRead();
    return super.productionQuantity;
  }

  @override
  set productionQuantity(int value) {
    _$productionQuantityAtom.reportWrite(value, super.productionQuantity, () {
      super.productionQuantity = value;
    });
  }

  final _$quantityAtom = Atom(name: 'FarmerControllerBase.quantity');

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

  final _$FarmerControllerBaseActionController =
      ActionController(name: 'FarmerControllerBase');

  @override
  dynamic increaseQuantity() {
    final _$actionInfo = _$FarmerControllerBaseActionController.startAction(
        name: 'FarmerControllerBase.increaseQuantity');
    try {
      return super.increaseQuantity();
    } finally {
      _$FarmerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decreaseQuantity() {
    final _$actionInfo = _$FarmerControllerBaseActionController.startAction(
        name: 'FarmerControllerBase.decreaseQuantity');
    try {
      return super.decreaseQuantity();
    } finally {
      _$FarmerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productionTime: ${productionTime},
productionQuantity: ${productionQuantity},
quantity: ${quantity}
    ''';
  }
}
