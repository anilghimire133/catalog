import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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
    _itemsIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemsIds.add(item.id);
  }
}
