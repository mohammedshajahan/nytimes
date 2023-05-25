import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:cookie_jar/cookie_jar.dart';

import 'package:dio/dio.dart';
import 'package:test/app/network/error.dart';
import 'package:test/app/network/response.dart';

enum HTTPMETHOD { GET, POST }

final apiBaseHelper = ApiBaseHelper();

class ApiBaseHelper {
  static BaseOptions opts = BaseOptions(
    responseType: ResponseType.json,
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static final dio = createDio();
  static final cookieJar = CookieJar();
  static final persistCookieJar = PersistCookieJar(ignoreExpires: true);
  static final baseAPI = addInterceptors(dio);

  DateTime? _startTime;
  DateTime? _endTime;

  static addInterceptors(Dio dio) {
    return dio;
  }

  Future<CustomeResponse> request({
    String? url,
    dynamic data,
    Map<String, dynamic>? headers,
    bool isCookie = true,
    HTTPMETHOD method = HTTPMETHOD.GET,
    Duration? timeOut,
  }) async {
    Response? response;
    try {
      /// Check For Network
      if (!await checkInternetConnectivity()) {
        return CustomeResponse(
          message: "Please enable your internet",
          data: null,
          success: false,
          fullResponse: null,
        );
      }
      switch (method) {
        case HTTPMETHOD.GET:
          _startTime = DateTime.now();
          response = await baseAPI.get(
            url,
            options: Options(
              headers: headers,
            ),
          );
          break;
        case HTTPMETHOD.POST:
          _startTime = DateTime.now();
          response = await baseAPI.post(
            url,
            data: data,
            options: timeOut == null
                ? Options(
                    headers: headers,
                  )
                : Options(receiveTimeout: timeOut, sendTimeout: timeOut),
          );
          break;
        default:
      }

      final resMessage = response?.data is Map ? response?.data["message"] : "";
      final resData = response?.data is Map ? response?.data["results"] : "";

      return CustomeResponse(
        success: true,
        message: resMessage,
        data: resData,
        fullResponse: response,
      );
    } on DioError catch (error) {
      return ErrorHandler.response(error);
    }
  }

  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return false;
    }
  }
}
