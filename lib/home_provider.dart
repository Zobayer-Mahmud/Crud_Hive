// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_crud/ItemModel.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final shoppingBox = Hive.box('shopping_box');
  List items = [];

  Future<void> updateData(
      {required int key, required Map<String, dynamic> newItem}) async {
    await shoppingBox.put(key, newItem);
    await getItems();
    controllerClear();
  }

  Future<void> createDate({required Map<String, dynamic> newItem}) async {
    await shoppingBox.add(newItem);

    await getItems();
    controllerClear();
  }

  ItemModel itemModel = ItemModel();
  bool isLoading = false;

  getItems() {
    isLoading = true;
    shoppingBox.length;

    final data = shoppingBox.keys.map((key) {
      final _item = shoppingBox.get(key);

      return {
        'key': key,
        'name': _item['name'],
        'email': _item['email'],
        'phone': _item['phone'],
      };
    }).toList();

    items = data.reversed.toList();
    isLoading = false;
    notifyListeners();
  }

  controllerClear() {
    nameController.text = '';
    emailController.text = '';
    phoneNumber.text = '';
  }
}
