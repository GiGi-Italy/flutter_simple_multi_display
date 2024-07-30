import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductProvider extends StateNotifier<String?> {
  ProductProvider() : super(null);
  void setProduct(String newProductId) {
    state = newProductId;
  }
}

final productProvider = StateNotifierProvider<ProductProvider, String?>(
  (ref) {
    return ProductProvider();
  },
);
