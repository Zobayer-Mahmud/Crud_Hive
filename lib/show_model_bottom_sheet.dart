import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_crud/ItemModel.dart';
import 'package:hive_crud/home_provider.dart';
import 'package:provider/provider.dart';

class openBottomSheet {
  static void showForm({required BuildContext context, int? itemKey}) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Phone"),
                    controller: homeProvider.phoneNumber,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Email"),
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
                            ? homeProvider.updateData()
                            : homeProvider.createDate(
                                newItem: itemModel.toJson());
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
