import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DB/drift_database.dart';
import 'Dev/account_gen.dart';

import 'home_page.dart';
import 'create_account_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class UserName {
  final String username;

  const UserName(this.username);

  String getUserName(){
    return username;
  }
}

class _LoginState extends State<Login> {


  late AppDatabase db;
  final username = TextEditingController();
  final password = TextEditingController();
  final _usernameKey = GlobalKey<FormState>();
  final _pwKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    db = Provider.of<AppDatabase>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (Dev.count == 0){
                db.insertAccount(Dev.account);
                db.insertTransactions(Dev.transaction);
                db.insertTransactions(Dev.transaction2);
                db.insertTransactions(Dev.transaction3);
                db.insertTransactions(Dev.transaction4);
              }
            },
            child:
              const Text('Generate Account', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Container(
                  width: 300,
                  height: 225,
                  child: Image.asset('assets/images/simucash_logo_light.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                key: _usernameKey,
                controller: username,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter a valid user name'),
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Please enter your username';
                  }
                  else if (db.usernameExists(username.text) == false ) {
                    return 'Username invalid';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0.0),
              child: TextFormField(
                key: _pwKey,
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Please enter your password';
                  }
                  else if (db.passwordCorrect(username.text,password.text) == false ) {
                    return 'Username invalid';
                  }
                  return null;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                // Forgot password
                // TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: const Color(0xffbe9e44),
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  // Create Account
                  if (_usernameKey.currentState!.validate() & _pwKey.currentState!.validate() ) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage(loggedin_username: UserName(username.text))));
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            TextButton(
              onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CreateAccount()));
              },
              child: const Text(
                'Create Account',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}