import "package:flutter/material.dart";
import 'package:counter_7/page/form.dart';
import "package:counter_7/main.dart";
import 'package:counter_7/page/show_data.dart';
import 'package:http/http.dart' as http;
import 'package:counter_7/model/my_watch_list.dart';
import 'package:counter_7/page/mywatchlist.dart';
import 'dart:convert';

class DetailPage extends StatelessWidget {
  final dynamic data;
  const DetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Detail")),
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
        body: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.fields.title,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(1, 10, 0, 0),
              child: Row(children: [
                const Text("Release Date: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  data.fields.releaseDate,
                )
              ])),
          Container(
              margin: const EdgeInsets.fromLTRB(1, 3, 0, 0),
              child: Row(children: [
                const Text("Rating: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  data.fields.rating.toString() + "/5",
                )
              ])),
          Container(
              margin: const EdgeInsets.fromLTRB(1, 3, 0, 0),
              child: Row(children: [
                const Text("Status: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  data.fields.watched,
                )
              ])),
          Container(
              margin: const EdgeInsets.fromLTRB(1, 3, 0, 0),
              child: Row(
                children: [
                  const Text("Review: ",
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(1, 3, 0, 0),
            child: Text(
              data.fields.review,
              overflow: TextOverflow.visible,
            ),
          )
        ]),
        floatingActionButton: Container(
            margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyWatchListPage()));
              },
              child: const Text('Back', style: TextStyle(color: Colors.white)),
            )));
  }
}
