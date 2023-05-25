import 'package:flutter/material.dart';
import 'package:test/app/common/constant.dart';
import 'package:test/app/common/size_config.dart';

///********** START test App TEXT ************
/// enum for scale category
enum TYPE_TOKEN { h1, h2, h3, h4, h5, h6, d1, d2, b1, b2 }

/// enum for font weight
enum FONTWEIGHT { light, bold, medium }
// enum DEVICETYPE { MOBILE, TABLET, DESKTOP }

/// MOBILE sizes
const MOBILE_TYPE_SCALE = {
  "D1": 50.0,
  "D2": 42.0,
  "46": 46.0,
  "h1": 36.0,
  "h2": 28.0,
  "h3": 24.0,
  "22": 24.0,
  "h4": 20.0,
  "h7": 18.0,
  "h5": 16.0,
  "h6": 14.0,
  "B1": 16.0,
  "B2": 14.0,
  "CAPTION": 12.0,
  "OVERLINE": 10.0,
  "18": 18.0,
  "8": 8.0,
};

/// TABLET sizes
const TABLET_TYPE_SCALE = {
  "D1": 68.0,
  "D2": 48.0,
  "h1": 42.0,
  "h2": 32.0,
  "h3": 26.0,
  "h4": 22.0,
  "h5": 16.0,
  "h6": 14.0,
  "B1": 16.0,
  "B2": 14.0,
  "CAPTION": 14.0,
  "OVERLINE": 12.0,
  "18": 18.0,
  "20": 20.0,
  "8": 10.0
};

/// DEKSTOP sizes

extension DEVICETYPEEXT on DEVICETYPE {
  Map<String, double> get typescale {
    switch (this) {
      case DEVICETYPE.MOBILE:
        return MOBILE_TYPE_SCALE;
      case DEVICETYPE.TABLET:
        return TABLET_TYPE_SCALE;
      default:
        return Map();
    }
  }
}

extension FONTWEIGHTEXT on FONTWEIGHT {
  FontWeight get value {
    switch (this) {
      case FONTWEIGHT.light:
        return FontWeight.w300;
      case FONTWEIGHT.medium:
        return FontWeight.w500;
      case FONTWEIGHT.bold:
        return FontWeight.w600;
      default:
        return value;
    }
  }
}

// test Text Style
TextStyle testTextStyle({
  String type: "B1",
  DEVICETYPE device: DEVICETYPE.MOBILE,
  FONTWEIGHT weight: FONTWEIGHT.medium,
}) {
  double? fontSize;
  FontWeight fontWeight;

  /// Font Size
  if (device == DEVICETYPE.MOBILE) {
    fontSize = MOBILE_TYPE_SCALE[type];
  } else if (device == DEVICETYPE.TABLET) {
    fontSize = TABLET_TYPE_SCALE[type];
  }

  /// Font Weight
  if (weight == FONTWEIGHT.bold) {
    fontWeight = FontWeight.w600;
  } else if (weight == FONTWEIGHT.light) {
    fontWeight = FontWeight.w300;
  } else {
    fontWeight = FontWeight.w500;
  }

  /// final style
  return TextStyle(
    color: primaryColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: "Poppins",
  );
}

///********** END test app TEXT STYLE ************

///********** END test app TEXT ************
