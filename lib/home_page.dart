import 'package:flutter/material.dart';

import 'package:hive_crud/show_model_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive Flutter"),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBottomSheet.showForm(context: context);
          print("Open Bottom sheet");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
