import 'package:flutter/material.dart';

import 'transfer_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/simucash_logo.png',
            fit: BoxFit.cover,
            height: 40,
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  const Text('Log Out', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        body: Center(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 80.0, vertical: 20),
                  child: Column(children: const [
                    Text('Account Balance',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('487 \$',
                            style: TextStyle(
                                color: Color(0xffbe9e44),
                                fontSize: 48,
                                fontWeight: FontWeight.w600)))
                  ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Date',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Type',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Amount',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Jan 1, 2022')),
                      DataCell(Text('Sent')),
                      DataCell(Text('50 \$')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Feb 14, 2022')),
                      DataCell(Text('Received')),
                      DataCell(Text('10 \$')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Feb 22, 2022')),
                      DataCell(Text('Deposit')),
                      DataCell(Text('200 \$')),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton.extended(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  'Funds',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                backgroundColor: Color(0xffd8c690),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => TransferPage()));
                },
                label: const Text(
                  '\$ Transfer',
                  style: TextStyle(
                      color: Color(0xffbe9e44),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                backgroundColor: Color(0xAA000000),
              ),
            ],
          ),
        ));
  }
}
