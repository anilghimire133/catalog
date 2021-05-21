import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  //collection of IDS - store ids of each items
  CatalogModel _catalog;

  final List<int> _itemsIds = [];

//get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

  // get item in the cart

  List<Item> get items => _itemsIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  // add items
  void add(Item item) {
    _itemsIds.add(item.id);
  }

  //remove items

  void remove(Item item) {
    items.remove(item.id);
  }
}
