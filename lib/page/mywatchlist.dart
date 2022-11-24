import "package:flutter/material.dart";
import 'package:counter_7/page/form.dart';
import "package:counter_7/main.dart";
import 'package:counter_7/page/show_data.dart';
import 'package:http/http.dart' as http;
import 'package:counter_7/model/my_watch_list.dart';
import 'package:counter_7/page/detail.dart';
import 'dart:convert';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<MyWatchListPage> createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchListPage> {
  Future<List<MyWatchList>> fetchMyWatchList() async {
    var url = Uri.parse('https://stenlytugas2.herokuapp.com/mywatchlist/json/');
    var response = await http.get(url, headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    });
    List<MyWatchList> listMyWatchList =
        myWatchListFromJson(utf8.decode(response.bodyBytes));

    return listMyWatchList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShowDataPage()),
                  );
                },
              ),
              ListTile(
                  title: const Text('My Watch List'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyWatchListPage()),
                    );
                  }),
            ],
          ),
        ),
        body: FutureBuilder(
            future: fetchMyWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watch list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(2.0),
                            child: ListTile(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 2,
                                      color: snapshot.data[index]!.fields
                                                  .watched ==
                                              "Sudah"
                                          ? Colors.blue
                                          : Colors.red),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: Text(snapshot.data![index].fields.title),
                                onTap: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                              data: snapshot.data![index])),
                                    )),
                          ));
                }
              }
            }));
  }
}
