import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/show_data.dart';
import 'package:flutter/services.dart';

var listData = [];

class FormBudgetPage extends StatefulWidget {
  const FormBudgetPage({super.key});

  @override
  State<FormBudgetPage> createState() => _FormBudgetState();
}

class _FormBudgetState extends State<FormBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  String? _judul = "";
  int _nominal = 0;
  String? jenis;
  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
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
                  MaterialPageRoute(builder: (context) => const ShowDataPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "",
                    labelText: "Judul",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Text field tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "",
                    labelText: "Nominal",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      _nominal = int.parse(value!);
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _nominal = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Text field tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ),
              DropdownButton(
                value: jenis,
                hint: const Text('Pilih Jenis'),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: listJenis.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    jenis = newValue!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: (() {
              if (_formKey.currentState!.validate()) {
                listData.add([_judul, _nominal, jenis]);
                _formKey.currentState!.reset();
              }
            }),
            child: const Text('Simpan', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
