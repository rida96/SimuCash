import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DB/drift_database.dart';

import 'login_page.dart';
import 'transfer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.loggedin_username}) : super(key: key);

  final UserName loggedin_username;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppDatabase db;

  static get loggedin_username => null;

  @override
  Widget build(BuildContext context) {
    db = Provider.of<AppDatabase>(context);
    final cardID = int.parse(db.loggedInUserCardID(loggedin_username.username));
    final balance = db.cardBalance(cardID);
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
                  child: Column(children: [
                    Text('Account Balance',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('\$ '+balance,
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
                      MaterialPageRoute(builder: (_) => TransferPage(loggedin_cardID: cardID)));
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



/*
StreamBuilder<List<CardTransaction>> _buildTransactionList(BuildContext context, int cardID ) {
  final db = Provider.of<AppDatabase>(context);
  return StreamBuilder(
    stream: db.watchCardTransactions(cardID),

    // TODO need to figure out how to user the builder
    builder: (context, AsyncSnapshot<List<CardTransaction>> snapshot) {
      final transactions = snapshot.data ?? List();


      return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (_, index) {
          final itemTask = transactions[index];
        },
      );
    },
  );
}

class _buildListItem {
}*/
