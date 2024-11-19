import 'dart:developer';

import 'package:artical_tast/core/networking/dio_handler.dart';
import 'package:artical_tast/core/networking/model/product_model.dart';
import 'package:dio/dio.dart';

class ProductRepo {
  ProductRepo(this.dioHandler);
  DioHandler dioHandler;
  Future<List<ProductModel>> fetchProduct() async {
    final res = await dioHandler.dio.get('https://fakestoreapi.com/products');
    if (res.statusCode == 200) {
      return (res.data as List<dynamic>)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception("Failed to load users:");
    }
  }


}
