class CatalogModel {
  static List<Item> items = [
    Item(
        id: 1,
        name: "Iphone 12 pro",
        desc: "Best price fone for rich",
        price: 122,
        color: "#33505a",
        image:
            "https://images.pexels.com/photos/3147528/pexels-photo-3147528.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      image: map["image"],
      color: map["color"],
    );
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "image": image,
        "color": color,
      };
}
