import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoadJsonPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _LoadJsonPageState createState() => _LoadJsonPageState();
}

class LoadJsonPage extends StatefulWidget {
  LoadJsonPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoadJsonPageState createState() => _LoadJsonPageState();
}

class _LoadJsonPageState extends State<LoadJsonPage> {
  @override
  void initState() {
    super.initState();
    // ローカルJSONをロード
    this.loadLocalJson();
  }

  List _jsonData; //データ
  // ローカルJSONをロード
  Future loadLocalJson() async {
    final json = await http
        .get("https://api.github.com/repositories/90792131/contributors");
    var result = jsonDecode(json.body);
    setState(() {
      print("-----jsondata:" + result.toString());
      _jsonData = result;
      print("--------------------");
    });
  }

  /*
  ----jsondata:{count: 3, address: sword, main: null, sword_data: [{id: 1, name: エクスカリバー, point: 150}, {id: 2, name: グングニル, point: 120}, {id: 3, name: グラム, point: 100}]}
I/flutter ( 7074): --------------------
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contributors"),
      ),
      // ListviewでJSONデータを表示
      body: ListView.builder(
          itemCount: _jsonData == null ? 0 : _jsonData.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                                "ID:" + _jsonData[index]['id'].toString(),
                                style: TextStyle(fontSize: 20.0)),
                            width: 200,
                          ),
                        ],
                      ),

                      // added padding
                      padding: const EdgeInsets.all(15.0),
                    ),
                  )
                ],
              )),
            );
          }),
    );
  }
}
