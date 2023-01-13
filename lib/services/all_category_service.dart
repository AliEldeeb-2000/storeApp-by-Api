import 'dart:convert';

import 'package:store/data/api.dart';

class AllCategoryService {
  Future<List<dynamic>> getAllCategories() async {
    var response =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    List<dynamic> data = jsonDecode(response.body);

    return data;
  }
}
