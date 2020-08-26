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
        title: new Text("Contributorsの詳細"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "名前: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                _detail != null
                    ? Text(
                        _detail['name'].toString(),
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      )
                    : Text('読み込み中'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Text(
                    "ユーザーID: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  _detail != null
                      ? Text(
                          _detail['login'].toString(),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                      : Text('読み込み中'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Text(
                    "フォロワー数: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  _detail != null
                      ? Text(
                          _detail['followers'].toString(),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                      : Text('読み込み中'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Text(
                    "フォロー数: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  _detail != null
                      ? Text(
                          _detail['following'].toString(),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                      : Text('読み込み中'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Text(
                    "会社: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  _detail != null
                      ? Text(
                          _detail['company'].toString(),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                      : Text('読み込み中'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Text(
                    "ロケーション: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  _detail != null
                      ? Text(
                          _detail['location'].toString(),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                      : Text('読み込み中'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Text(
                    "パブリックリポジトリ数: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  _detail != null
                      ? Text(
                          _detail['public_repos'].toString(),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                      : Text('読み込み中'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Text(
                    " パブリックgist数: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  _detail != null
                      ? Text(
                          _detail['public_gists'].toString(),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                      : Text('読み込み中'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Text(
                    "Twitterアカウント: @",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  _detail != null
                      ? Text(
                          "" + _detail['twitter_username'].toString(),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                      : Text('読み込み中'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "GitHubのURL: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  _detail != null
                      ? Text(
                          "" + _detail['html_url'].toString(),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                      : Text('読み込み中'),
                ],
              ),
            ),
          ],
        ),
      ),
      //child: Text(_jsonData[index]['name'].toString())),
    );
  }
}
