import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'contributors_detail.dart';

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
    this.loadLocalJson();
  }

  List _jsonData;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.teal,
          title: Column(
            children: <Widget>[
              Text(
                "architecture-components-samplesの",
                style: TextStyle(fontSize: 19),
              ),
              Text(
                "Contributors一覧",
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: _jsonData == null ? 0 : _jsonData.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContributorsDetail(
                            _jsonData[index]['url'].toString() != null
                                ? _jsonData[index]['url'].toString()
                                : '',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Container(
                        height: 65,
                        //width: ,
                        child: Row(
                          children: [
                            Column(
                              children: <Widget>[
                                Text(
                                    "ユーザー名 : " +
                                        _jsonData[index]['login'].toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20)),
                                Text(
                                  "ID : " + _jsonData[index]['id'].toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
