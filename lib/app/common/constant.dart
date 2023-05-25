import 'package:flutter/material.dart';

enum DEVICETYPE { MOBILE, TABLET, DESKTOP }

const String connectionTimeout =
    "Oops something went wrong please try after sometime";
const String unauthorization = "You are not authorized";
const String badrequest = "Oops something went wrong please try after sometime";
const String internalServer =
    "Oops something went wrong please try after sometime";
const String unknow = "Oops something went wrong please try after sometime";
const String somethingWrong =
    "Oops something went wrong please try after sometime";
const String cancel = "Request is cancelled";
const String dataException = "No Record Found";
const String notFound = "No Record Found";
const String noDataFound = "No Record Found";
const String invalidUseridPassword = "Invalid username or password";
const String internetError = "Please enable your internet";
const String payrolllock =
    "Payroll activities are in progress. You will not be able to update/approve any data. However, you can view past data";
const String feedbackSuccess = "feedback submitted successfully";
const String loginError =
    'Domain ID/OID or password is incorrect. Please try again.';
const String connectionError =
    "Please check your internet connection and try again.";
const String dataError = "No Data Available";

Widget kVerticalSpace({height = 10.0}) => SizedBox(height: height);
Widget pVerticalSpace({height = 8.0}) => SizedBox(height: height);
Widget kHorizontalSpace({width = 10.0}) => SizedBox(width: width);
Widget pHorizontalSpace({width = 8.0}) => SizedBox(width: width);

const primaryColor = Color(0xFF47E4C2);
const colorWhite = Color(0xFFFFFFFF);

const kShadowColor = Color(0xFFD6D6D6);
final shadowColor1 = Color(0xFF000000).withOpacity(0.1);
const errorColor = Color(0xFFED544E);
const kGrey05 = Color(0xFFF2F2F2);
const kErrorColor = Color(0xFFED544E);
const kGrey20 = Color(0xFFCFCFCF);
const kGrey40 = Color(0xFF9A9A9A);
const kGrey = Color(0xFF626262);
const kGrey80 = Color(0xFF626262);
const kTextDarkCoralColor = Color(0xFF45545E);
