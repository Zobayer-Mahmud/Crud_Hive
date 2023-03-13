class ItemModel {
  int? key;
  String? name, email, phone;
  ItemModel({this.name, this.phone, this.key, this.email});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['key'] = key;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;

    return data;
  }
}
