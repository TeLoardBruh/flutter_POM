import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// here import the file to use
// import './pages/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = 'https://randomuser.me/api/?results=15';
  List data;
  Future<String> makeRequest() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractData = jsonDecode(res.body);
      data = extractData["results"];
    });

    // print(data[0]["name"]);
  }

  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Contact List'),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, i) {
          return new ListTile(
            title: new Text(data[i]["name"]["first"]),
            subtitle: new Text(data[i]["phone"]),
            leading: new CircleAvatar(
              backgroundImage:
                  new NetworkImage(data[i]["picture"]["thumbnail"]),
            ),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  // import here to use
                  // builder: (BuildContext context) => new ProfilePage(
                  //   data[i],
                  // ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
