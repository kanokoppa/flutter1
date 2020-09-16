import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  Info({this.text});

  final String text;

  Map<String, dynamic> _detail;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }
}
