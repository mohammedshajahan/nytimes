import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test/app/common/constant.dart';
import 'package:test/app/network/helper.dart';
import 'package:test/app/network/response.dart';

class ErrorHandler {
  static bool isFirstTime = true;

  static response(DioError? exception) {
    try {
      String message;
      switch (exception!.type) {
        case DioErrorType.receiveTimeout:
          message = connectionTimeout;
          return CustomeResponse(
              success: false,
              message: connectionTimeout,
              data: null,
              fullResponse: connectionTimeout);

        case DioErrorType.connectionTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.badCertificate:
          // TODO: Handle this case.
          break;
        // case DioErrorType.badResponse:
        //   // TODO: Handle this case.
        //   break;
        case DioErrorType.connectionError:
          // TODO: Handle this case.
          break;
        case DioErrorType.unknown:
          // TODO: Handle this case.
          break;
        case DioErrorType.sendTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.cancel:
          // TODO: Handle this case.
          break;

        case DioErrorType.badResponse:
          switch (exception.response!.statusCode) {
            case 400:
              if (exception.response!.data is Map) {
                message = exception.response!.data["message"] != null
                    ? (exception.response!.data["message"] is String
                        ? exception.response!.data["message"]
                        : badrequest)
                    : exception.response!.data["result"] is String
                        ? exception.response!.data["result"]
                        : exception.response!.data["result"]["message"] != null
                            ? (exception.response!.data["result"]["message"]
                                    is String
                                ? exception.response!.data["result"]["message"]
                                : badrequest)
                            : badrequest;
              } else {
                message = exception.response?.statusMessage ?? "";
              }
              return CustomeResponse(
                success: false,
                message: message,
                data: null,
                fullResponse: exception.response!.data,
              );
              break;
            case 401:
              if (exception.response!.data is Map) {
                message = exception.response!.data["message"] ??
                    (exception.response!.data["result"]["message"] ??
                        unauthorization);
              } else {
                message = exception.response?.statusMessage ?? "";
              }
              if (isFirstTime && message.toLowerCase() == "invalid cookies") {
                isFirstTime = false;
              }
              return CustomeResponse(
                success: false,
                message: message,
                data: null,
                fullResponse: exception.response!.data,
              );
              break;
            case 404:
              if (exception.response!.data is Map) {
                message = exception.response!.data["message"] ??
                    exception.response!.data["result"]["message"] ??
                    notFound;
              } else {
                message = exception.response?.statusMessage ?? "";
              }
              return CustomeResponse(
                success: false,
                message: message,
                data: null,
                fullResponse: exception.response!.data,
              );
              break;
            case 417:
              if (exception.response!.data is Map) {
                message = exception.response!.data["message"] ??
                    (exception.response!.data["result"]["message"] ?? notFound);
              } else {
                message = exception.response?.statusMessage ?? "";
              }
              return CustomeResponse(
                success: false,
                message: message,
                data: null,
                fullResponse: exception.response!.data,
              );
              break;
            case 500:
              if (exception.response!.data is Map) {
                message = !GetUtils.isNullOrBlank(
                            exception.response!.data["result"])! &&
                        !GetUtils.isNullOrBlank(
                            exception.response!.data["result"]["message"])! &&
                        exception.response!.data["result"]["message"] is String
                    ? exception.response!.data["result"]["message"]
                    : exception.response!.data["message"];
              } else {
                message = exception.response?.statusMessage ?? "";
              }
              return CustomeResponse(
                success: false,
                message: message,
                data: null,
                fullResponse: exception.response!.data,
              );
              break;
            default:
              if (exception.response != null) {
                message = exception.response!.statusMessage ?? unknow;
                return CustomeResponse(
                  success: false,
                  message: message,
                  data: null,
                  fullResponse: exception.response!.statusMessage != null
                      ? exception.response!.statusMessage.toString()
                      : exception.response.toString(),
                );
              } else {
                return CustomeResponse(
                  success: false,
                  message: unknow,
                  data: null,
                  fullResponse: exception.response.toString(),
                );
              }
              break;
          }
          break;
      }
    } on Exception catch (error) {
      /*Logger.writeLog('errorOth: $error');*/
    }
  }
}
