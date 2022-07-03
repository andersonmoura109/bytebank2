class Contact {
  final int? id;
  final String name;
  final int account;

  Contact({this.id, required this.name, required this.account});

  @override
  String toString() {
    return 'Created Account Number: $id Account: $account Name: $name';
  }
}
