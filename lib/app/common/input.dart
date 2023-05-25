// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:test/app/common/constant.dart';
import 'package:test/app/common/size_config.dart';
import 'package:test/app/common/text.dart';

class UiInputFieldNew extends StatelessWidget {
  final String label;
  final String hintText;
  final Color color;
  final int maxLines;
  final TextStyle labelStyle;
  final TextStyle iinputStyle;
  final FocusNode focusNode;
  final Function requestFocus;
  final Function validator;
  final Function onChanged;
  final Function onEditingComplete;
  final Function onTap;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final bool isError;
  final bool isShadow;
  final bool obscureText;
  final TextEditingController controller;

  final textInputType;
  final textInputAction;
  final inputFormatters;

  UiInputFieldNew(
      {this.label = "",
      this.hintText = "",
      this.color = Colors.white,
      this.isShadow = true,
      this.suffixIcon,
      this.prefixIcon,
      this.maxLines = 1,
      this.labelStyle,
      this.iinputStyle,
      this.controller,
      this.focusNode,
      this.requestFocus,
      this.validator,
      this.onTap,
      this.obscureText = false,
      this.onChanged,
      this.onEditingComplete,
      this.isError = false,
      this.textInputType,
      this.textInputAction,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!label.contains(""))
          Text(
            label,
            style: labelStyle,
          ),
        if (!label.contains("")) kVerticalSpace(height: 5.0),
        Container(
          height: 51.0,
          padding: const EdgeInsets.symmetric(
            // horizontal: 16.0,
            vertical: 6.0,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
            border: isError
                ? Border.all(
                    color: errorColor,
                  )
                : null,
            boxShadow: isShadow
                ? [
                    BoxShadow(
                      color: shadowColor1,
                      blurRadius: 6.0,
                      spreadRadius: 0.0, // soften the shadow
                    )
                  ]
                : null,
          ),
          child: Stack(
            children: [
              TextFormField(
                controller: controller,
                style: iinputStyle,
                onChanged: onChanged,
                onEditingComplete: onEditingComplete,
                obscureText: obscureText,
                keyboardType: textInputType ?? TextInputType.text,
                textInputAction: textInputAction ?? TextInputAction.done,
                inputFormatters: inputFormatters,
                onTap: () {
                  onTap();
                  requestFocus(focusNode);
                },
                decoration: InputDecoration(
                  contentPadding: prefixIcon == null
                      ? const EdgeInsets.only(bottom: 12, left: 10)
                      : const EdgeInsets.only(bottom: 12, left: 36),
                  hintText: hintText,
                  hintStyle: testTextStyle(
                    device: SizeConfig.devicetype,
                    type: "B2",
                    weight: FONTWEIGHT.light,
                  ).copyWith(
                    color: kShadowColor,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: prefixIcon.paddingOnly(left: 10) ?? Container(),
              ),
              Align(
                child: suffixIcon.paddingOnly(right: 14.0) ?? Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AlwaysDisabledFocusNode1 extends FocusNode {
  @override
  bool get hasFocus => false;
}

class UIDropdownItem {
  final String id;
  final String description;

  UIDropdownItem({
    @required this.id,
    @required this.description,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UIDropdownItem &&
        other.id == id &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}

/// UI DropDown
class UiCommonInput extends StatelessWidget {
  final bool isEdit;
  final bool isError;
  final Widget suffixIcon;
  final String label;
  final String hintText;
  final UIDropdownItem selectedValue;
  final List<UIDropdownItem> listOfItems;
  final Function onChange;
  final double fieldWidth;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final int minLines;
  final int maxLines;
  final int maxLength;
  final FocusNode focusNode;
  final bool isInput;
  final bool isDatePicker;
  final bool disable;

  final GlobalKey _globalKey = GlobalKey();

  UiCommonInput(
      {Key key,
      this.isEdit = true,
      this.isError = false,
      this.minLines,
      this.isInput = false,
      this.isDatePicker = false,
      this.maxLines,
      this.maxLength,
      this.focusNode,
      this.inputFormatters,
      this.suffixIcon,
      this.fieldWidth = 34.0,
      this.keyboardType,
      this.controller,
      this.textInputAction,
      this.label,
      this.hintText,
      this.selectedValue,
      this.onChange,
      this.listOfItems,
      this.disable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: isEdit ? kGrey05 : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isEdit
              ? isError
                  ? kErrorColor
                  : Colors.transparent
              : kGrey20,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Stack(
              children: [
                Row(
                  children: [
                    Text(label,
                        style: testTextStyle(
                          weight: FONTWEIGHT.medium,
                          type: "B2",
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4.0,
                  ),
                  child:
                      isInput ? _inputFormField(context) : _dropDownFormField(),
                )
              ],
            ),
          ),
          suffixIcon != null
              ? isEdit
                  ? GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if (isDatePicker) {
                          _selectDate(context);
                        } else {
                          openDropdown();
                        }
                      },
                      child: suffixIcon,
                    )
                  : Container()
              : Container(),
        ],
      ),
    );
  }

  Widget _inputFormField(BuildContext context) {
    return Container(
      height: fieldWidth,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
        ),
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          readOnly: disable,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          onChanged: (value) {
            if (onChange != null) onChange(value);
          },
          validator: (value) {
            return null;
          },
          minLines: minLines,
          maxLines: maxLines,
          maxLength: maxLength,
          focusNode: isDatePicker ? AlwaysDisabledFocusNode1() : focusNode,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              bottom: 4,
              top: 12,
            ),
            hintText: hintText,
            hintStyle: testTextStyle(
              device: SizeConfig.devicetype,
              type: "B1",
              weight: FONTWEIGHT.light,
            ).copyWith(color: kGrey),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendar,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: primaryColor,
              primaryColorDark: primaryColor,
              accentColor: primaryColor,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child,
          ),
        );
      },
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
    );
    if (pickedDate != null) {
      final format = DateFormat('dd/MM/yyyy');
      controller.text = format.format(pickedDate).toString();
      onChange(pickedDate.toIso8601String());
    }
  }

  //Perform Manual click on Dropdown to open onClick of right Arrow
  openDropdown() {
    GestureDetector detector;
    void searchForGestureDetector(BuildContext element) {
      // ignore: void_checks
      element.visitChildElements((element) {
        if (element.widget != null && element.widget is GestureDetector) {
          detector = element.widget;
          return false;
        } else {
          searchForGestureDetector(element);
        }

        return true;
      });
    }

    searchForGestureDetector(_globalKey.currentContext);
    assert(detector != null);

    if (detector != null && detector.onTap != null) detector?.onTap();
  }

  Widget _dropDownFormField() {
    return FormField(
      initialValue: selectedValue,
      validator: (value) {
        return null;
      },
      builder: (
        FormFieldState<UIDropdownItem> state,
      ) {
        return _getDropDownInput(
          formState: state,
        );
      },
    );
  }

  Widget _getDropDownInput({
    FormFieldState<UIDropdownItem> formState,
  }) {
    return Container(
      height: 32,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<UIDropdownItem>(
            isExpanded: true,
            underline: null,
            key: _globalKey,
            hint: Text(
              hintText,
              style: testTextStyle(
                device: SizeConfig.devicetype,
                type: "B2",
                weight: FONTWEIGHT.light,
              ).copyWith(color: kGrey80),
              textScaleFactor: 1.0,
            ),
            value: selectedValue,
            // selectedItemBuilder:
            icon: Container(),
            // ignore: prefer_null_aware_operators
            items: listOfItems != null
                ? listOfItems.map(
                    (UIDropdownItem value) {
                      return DropdownMenuItem<UIDropdownItem>(
                        value: value,
                        child: Text(
                          value.description,
                          style: testTextStyle(
                            weight: FONTWEIGHT.medium,
                            device: SizeConfig.devicetype,
                            type: "B2",
                          ).copyWith(
                            color: kTextDarkCoralColor,
                          ),
                          textScaleFactor: 1.0,
                        ),
                      );
                    },
                  ).toList()
                : null,
            onChanged: (value) {
              onChange(value);
            },
          ),
        ),
      ),
    );
  }
}
