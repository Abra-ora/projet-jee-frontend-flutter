import 'package:flutter/material.dart';
import 'package:studi_kasus/theme.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  String full_name;
  String password;
  String email;

  CustomPrimaryButton({this.buttonColor, this.textValue, this.textColor, this.full_name, this.email, this.password});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14.0),
      elevation: 0,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {

              print(this.email);
            },
            borderRadius: BorderRadius.circular(14.0),
            child: Center(
              child: Text(
                textValue,
                style: heading5.copyWith(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
