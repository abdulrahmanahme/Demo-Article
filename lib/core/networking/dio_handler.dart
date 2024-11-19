import 'dart:developer';

import 'package:dio/dio.dart';

class DioHandler {
  DioHandler._();
  static final DioHandler _singleton = DioHandler._();

  factory DioHandler() {
    return _singleton;
  }

  Dio get dio {
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );

    return dio;
  }



}
