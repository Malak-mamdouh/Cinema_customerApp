import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onClick;
  String _errorMessage(String str) {
    switch (hint) {
      case 'Enter Your Name':
        return 'Name is empty';
      case 'Enter Your Email':
        return 'Email is empty';
      case 'Enter Your Password':
        return 'Password is empty';
    }
  }

  CustomTextField({@required this.onClick ,@required this.hint, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return _errorMessage(value);
          }
        },
        onSaved: onClick,
        obscureText: hint == 'Enter Your Password' ? true: false,
        cursorColor: KMainColor,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: KMainColor,
            ),
            filled: true,
            fillColor: KSecondaryColor,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }
}
