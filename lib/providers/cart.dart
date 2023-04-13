import 'package:flutter/foundation.dart';

class CardItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CardItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CardItem> _items;

  Map<String, CardItem> get items {
    return {..._items};
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      //change quantity
      _items.update(
        productId,
        (existingCardItem) => CardItem(
          id: existingCardItem.id,
          title: existingCardItem.title,
          quantity: existingCardItem.quantity + 1,
          price: existingCardItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CardItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }
  }
}
