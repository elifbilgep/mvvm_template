import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mvvm_template/core/base/model/base_error.dart';
import 'package:mvvm_template/core/base/model/base_model.dart';
import 'package:mvvm_template/core/init/cache/locale_manager.dart';
import 'package:mvvm_template/core/init/enums/preferences_key_enum.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  //Singleton
  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      headers: {
        "val": LocaleManager.instance!.getStringValue(PreferencesKeyEnum.TOKEN),
      },
    );
    Dio? dio = Dio(baseOptions);

    dio.interceptors.add(InterceptorsWrapper(
      onError: (e, _) {
        BaseError(
          message: e.message,
        );
      },
      onRequest: (options, handler) {
        // options.path += "elif";
      },
      onResponse: (e, handler) {
        //return e.data;
      },
    ));
  }

  Dio? _dio;

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio!.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map<String, Object>) {
          return model.fromJson(responseBody);
        }
        return responseBody;

      default:
    }
  }
}
