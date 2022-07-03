import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/contact.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'bytebank.db');

      return openDatabase(path, onCreate: (db, version) {
        db.execute('CREATE TABLE contacts('
            'id INTEGER PRIMARY KEY, '
            'name TEXT, '
            'account_number INTEGER)');
      }, version: 1);
    },
  );
}

Future<int>? save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = {};

    contactMap['id'] = contact.id;
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.account;

    return db.insert('contacts', contactMap);
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then(
    (db) {
      return db.query('contacts').then(
        (contactMaps) {
          final List<Contact> contactsList = [];

          for (Map<String, dynamic> contact in contactMaps) {
            final Contact addContact = Contact(
              id: contact['id'],
              name: contact['name'],
              account: contact['account_number'],
            );
            contactsList.add(addContact);
          }
          return contactsList;
        },
      );
    },
  );
}
