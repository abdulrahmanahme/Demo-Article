import 'package:artical_tast/core/networking/eum.dart';
import 'package:artical_tast/core/networking/model/product_model.dart';

class ProductState {
  const ProductState({
    this.status = ProductEnum.initial,
    this.productModel = const [],
  });
  final List<ProductModel> productModel;
  final ProductEnum status;

  ProductState copyWith({
    List<ProductModel>? productModel,
    ProductEnum? status,
  }) {
    return ProductState(
        status: status ?? this.status,
        productModel: productModel ?? this.productModel);
  }
}
