import 'package:flutter/material.dart';

void main() {
  runApp(const Bytebank());
}

class Bytebank extends StatelessWidget {
  const Bytebank({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Column(
          children: [
            Image.asset('assets/images/bytebank_logo.png'),
            Container(
              width: 100,
              height: 120,
              color: Colors.green,
              child: Column(
                children: const [
                  Icon(Icons.people),
                  Text('Contacts'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
