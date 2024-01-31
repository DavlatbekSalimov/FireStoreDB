class Contact {
  String name;
  String phonenumber;
  String address;
  String id;
  String company;
  bool isFavourite;

  Contact(
      {required this.name,
      required this.phonenumber,
      required this.address,
      required this.company,
      required this.id,
      required this.isFavourite});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phonenumber': phonenumber,
      'address': address,
      'company': company,
      'isFavourite': isFavourite,
      'id': id,
    };
  }
}
