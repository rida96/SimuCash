import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransferPage extends StatefulWidget {
  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  String actionMesage = '';
  bool displayActionMessage = false;

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
            child: const Text('Log Out', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: const Text(
                  "If you would like to receive funds from someone else just press the receive button and wait for the confirmation message!"),
            ),
            const Text(
                "Otherwise, enter the amount you would like to send below:"),
            TextField(
              decoration: const InputDecoration(
                  labelText: "How much would you like to send?"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // This button executes the logic to receve money from an offline terminal to the online terminal with NFC
            FloatingActionButton.extended(
              onPressed: () {
                //TODO Logic here
              },
              icon: const Icon(Icons.account_balance_wallet_outlined,
                  color: Colors.white),
              label: const Text(
                'Receive',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              backgroundColor: const Color(0xffd8c690),
            ),
            // This function executes the logic to send money from an online terminal to an offline terminal with NFC
            FloatingActionButton.extended(
              onPressed: () {
                //TODO Logic here
              },
              label: const Text(
                '\$ Send',
                style: TextStyle(
                    color: Color(0xffbe9e44),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              backgroundColor: const Color(0xAA000000),
            ),
          ],
        ),
      ),
    );
  }
}
