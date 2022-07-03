class Contact {
  final String name;
  final int account;

  Contact({required this.name, required this.account});

  @override
  String toString() {
    return 'Created Account: $account Name: $name';
  }
}
