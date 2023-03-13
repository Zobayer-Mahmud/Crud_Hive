import 'package:flutter/material.dart';
import 'package:hive_crud/home_provider.dart';

import 'package:hive_crud/show_model_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive Flutter"),
        centerTitle: true,
      ),
      body: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
        return RefreshIndicator(
          onRefresh: () async {
            await homeProvider.getItems();
          },
          child: homeProvider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : homeProvider.items.isNotEmpty
                  ? ListView.builder(
                      itemCount: homeProvider.items.length,
                      itemBuilder: (context, int index) {
                        return Card(
                          color: Colors.amberAccent,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xff764abc),
                              child:
                                  Text("${homeProvider.items[index]['key']}"),
                            ),
                            title: Text(
                                "${homeProvider.items[index]['name'] ?? 'N/A'}"),
                            subtitle: Text(
                                "${homeProvider.items[index]['phone'] ?? 'N/A'}"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      openBottomSheet.showForm(
                                        context: context,
                                        itemKey: homeProvider.items[index]
                                            ['key'],
                                        name: homeProvider.items[index]['name'],
                                        email: homeProvider.items[index]
                                            ['email'],
                                        phone: homeProvider.items[index]
                                            ['phone'],
                                      );
                                    },
                                    child: const Icon(Icons.edit)),
                                const SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                    child: const Icon(Icons.delete)),
                              ],
                            ),
                          ),
                        );
                      })
                  : const Center(
                      child: Text(
                        " Sorry, No data available",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBottomSheet.showForm(context: context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
