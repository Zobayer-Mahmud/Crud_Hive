import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_crud/ItemModel.dart';
import 'package:hive_crud/home_provider.dart';
import 'package:provider/provider.dart';

class openBottomSheet {
  static void showForm(
      {required BuildContext context,
      int? itemKey,
      String? name,
      email,
      phone}) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    if (itemKey != null) {
      homeProvider.nameController.text = name ?? '';
      homeProvider.emailController.text = email ?? '';
      homeProvider.phoneNumber.text = phone ?? '';
    }
    showModalBottomSheet(
        context: context,
        builder: (_) => Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 100, top: 20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Name"),
                    controller: homeProvider.nameController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Phone"),
                    controller: homeProvider.phoneNumber,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Email"),
                    textInputAction: TextInputAction.done,
                    controller: homeProvider.emailController,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.green),
                      ),
                      onPressed: () {
                        ItemModel itemModel = ItemModel();
                        itemModel.name = homeProvider.nameController.text;
                        itemModel.email = homeProvider.emailController.text;
                        itemModel.phone = homeProvider.phoneNumber.text;
                        itemKey != null
                            ? homeProvider.updateData(
                                key: itemKey, newItem: itemModel.toJson())
                            : homeProvider.createDate(
                                newItem: itemModel.toJson());
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        itemKey != null ? "Update" : "Save",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
