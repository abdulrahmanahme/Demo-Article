import 'package:artical_tast/core/networking/eum.dart';
import 'package:artical_tast/cubit/product_state.dart';
import 'package:artical_tast/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo)
      : super(const ProductState(
          status: ProductEnum.initial,
        ));
  ProductRepo productRepo;

  Future<void> fetchProduct() async {
    emit(
      state.copyWith(status: ProductEnum.loading),
    );
    try {
      var productData = await productRepo.fetchProduct();
      emit(
        state.copyWith(status: ProductEnum.success, productModel: productData),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: ProductEnum.failure,
        ),
      );
    }
  }
}
