import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                      onPressed: () {
                        itemKey != null
                            ? homeProvider.updateData()
                            : homeProvider.createDate();
                      },
                      child: Text(itemKey != null ? "Update" : "Save"),
                    ),
                  )
                ],
              ),
            ));
  }
}
