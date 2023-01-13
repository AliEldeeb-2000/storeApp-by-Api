import 'dart:convert';

import 'package:store/data/api.dart';

import '../models/product_model.dart';

class AllProductService{
  Future<List<ProductModel>> getAllProduct() async {

    final response = await Api().get(url:'https://fakestoreapi.com/products');

      List<dynamic> data = jsonDecode(response.body);

      List<ProductModel> productList = [];
      for (int i = 0; i < data.length; i++) {
        productList.add(ProductModel.fromJson(data[i]));
      }
      return productList;
    }

}
