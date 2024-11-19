import 'package:artical_tast/core/networking/eum.dart';
import 'package:artical_tast/cubit/product_state.dart';

extension EnumStates on ProductState {
  bool get isInitial => status == ProductEnum.initial;
  bool get isLoading => status == ProductEnum.loading;
  bool get isSuccess => status == ProductEnum.success;
  bool get isFailure => status == ProductEnum.failure;
}
