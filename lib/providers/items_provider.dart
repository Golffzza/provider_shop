import 'package:flutter/material.dart';
import 'package:flutter_edit_lab/models/items.dart';

class ItemProvider extends ChangeNotifier {
  final List<Item> _items = [
    Item(
      id: '1',
      name: 'Iphone 17 super pro max',
      description: 'Apple A19 super pro',
      price: 49999,
    ),
    Item(
      id: '2',
      name: 'Hp Victus16 Labtop',
      description: 'Intel Core i11, 64GB RAM',
      price: 45000,
    ),
    Item(
      id: '3',
      name: 'Macbook super pro',
      description: 'Apple M20 super max pro',
      price: 59999,
    ),
  ];

  List<Item> get items => [..._items];

  Item findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  void updateItem(String id, Item newItemData) {
    final itemIndex = _items.indexWhere((item) => item.id == id);
    if (itemIndex >= 0) {
      _items[itemIndex] = newItemData;
      notifyListeners();
    }
  }
}
