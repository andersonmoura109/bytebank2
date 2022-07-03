import 'package:bytebank2/database/database.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Bytebank());
  save(
    Contact(
      name: 'Anderson',
      account: 1989,
    ),
  )?.then((id) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
}

class Bytebank extends StatelessWidget {
  const Bytebank({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.green.shade900,
          onPrimary: Colors.white,
          secondary: Colors.blueAccent.shade700,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.black,
          onBackground: Colors.white,
          surface: Colors.grey,
          onSurface: Colors.white,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent.shade700,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const Dashboard(),
    );
  }
}
