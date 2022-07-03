import 'package:bytebank2/screens/contact/form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: Icon(
                Icons.person,
                size: 40,
                color: Colors.lightGreen.shade600,
              ),
              title: const Text('Alex'),
              subtitle: const Text('1000'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const ContactForm(),
                ),
              )
              .then(
                (value) => {
                  debugPrint(
                    value.toString(),
                  )
                },
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
