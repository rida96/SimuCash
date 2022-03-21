import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DB/drift_database.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AppDatabase(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Login(),
      ),

    );
  }
}


