import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ContributorsDetail extends StatefulWidget {
  final url;
  ContributorsDetail(this.url);

  @override
  _ContributorsDetailState createState() => _ContributorsDetailState();
}

class _ContributorsDetailState extends State<ContributorsDetail> {
  @override
  void initState() {
    super.initState();
    detail();
  }

  Map<String, dynamic> _detail;

  Future detail() async {
    print(widget.url);
    final json = await http.get(widget.url);
    final result = jsonDecode(json.body);
    setState(() {
      _detail = result;
    });
  }

  Widget build(
    BuildContext context,
  ) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.url),
      ),
      body: Column(
        children: <Widget>[

          _detail != null ? Text(_detail['name']) : Text('読み込み中'),
        ],
      ),
      //child: Text(_jsonData[index]['name'].toString())),
    );
  }
}
