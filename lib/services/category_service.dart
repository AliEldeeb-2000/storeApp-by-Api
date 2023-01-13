import 'dart:convert';

import 'package:store/data/api.dart';

import '../models/product_model.dart';

class CategoryService {
  Future<List<ProductModel>> getCategoriesProduct(
      {required String categoryName}) async {
    var response = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/:$categoryName');

    List<dynamic> data = jsonDecode(response.body);

    List<ProductModel> productList = [];
    for (var i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }

    return productList;
  }
}
