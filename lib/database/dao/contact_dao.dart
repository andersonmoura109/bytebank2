import 'package:sqflite/sqflite.dart';

import '../../models/contact.dart';
import '../database.dart';

class ContactDao {
  static const String _tableSql = 'CREATE TABLE $_table('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account_number INTEGER)';

  static const String _table = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int>? save(Contact contact) async {
    final Database db = await getDatabase(_tableSql);

    final Map<String, dynamic> contactMap = {};

    contactMap[_id] = contact.id;
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.account;

    return db.insert(_table, contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase(_tableSql);
    final List<Map<String, dynamic>> result = await db.query(_table);

    List<Contact> contactsList = toList(result);

    return contactsList;
  }

  List<Contact> toList(List<Map<String, dynamic>> result) {
    List<Contact> contactsList = toMap(result);

    return contactsList;
  }

  List<Contact> toMap(List<Map<String, dynamic>> result) {
    final List<Contact> contactsList = [];

    for (Map<String, dynamic> contact in result) {
      final Contact addContact = Contact(
        id: contact[_id],
        name: contact[_name],
        account: contact[_accountNumber],
      );

      contactsList.add(addContact);
    }
    return contactsList;
  }
}
