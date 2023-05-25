import 'package:flutter/foundation.dart';

class CustomeResponse {
  bool? success;
  String? message;
  dynamic data;
  dynamic fullResponse;
  CustomeResponse({
    this.success,
    this.message,
    this.data,
    this.fullResponse,
  });
}
