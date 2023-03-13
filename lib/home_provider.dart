import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final shoppingBox = Hive.box('shopping_box');
  updateData() {}
  Future<void> createDate({required Map<String, dynamic> newItem}) async {
    print(newItem['name']);
    print(newItem['phone']);
    print(newItem['email']);
    print(newItem);
    await shoppingBox.add(newItem);
  }

  controllerClear() {
    nameController.text = '';
    emailController.text = '';
    phoneNumber.text = '';
  }
}
