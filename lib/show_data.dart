import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';

class ShowDataPage extends StatelessWidget {
  const ShowDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Budget'),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                title: const Text('counter_7'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyHomePage(title: 'Program Counter')),
                  );
                },
              ),
              ListTile(
                title: const Text('Tambah Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FormBudgetPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Data Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShowDataPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: List.generate(listData.length, (index) {
            return Container(
              margin: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(listData[index][0]),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(listData[index][1].toString()),
                              Text(listData[index][2]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }, growable: true),
        ));
  }
}
