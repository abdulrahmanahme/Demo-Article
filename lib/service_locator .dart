import 'package:artical_tast/cubit/product_cubit.dart';
import 'package:artical_tast/repo/product_repo.dart';
import 'package:get_it/get_it.dart';

import 'core/networking/dio_handler.dart';

final sl = GetIt.instance;

class ServiceLocator  {
 static void setUp() {
    sl.registerLazySingleton<DioHandler>(() => DioHandler());

    sl.registerLazySingleton<ProductRepo>(() => ProductRepo(sl()));
  
    sl.registerLazySingleton<ProductCubit>(() => ProductCubit(sl()));

  }
}
