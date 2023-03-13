class ItemModel {
  String? name, email, phone;
  ItemModel({this.name, this.phone, this.email});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;

    return data;
  }
}
