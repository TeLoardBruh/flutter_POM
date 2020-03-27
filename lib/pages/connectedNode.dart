import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  String serverResponse = 'Server response';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing Node"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Send request to server'),
                  onPressed: () {
                    _makeGetRequest();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(serverResponse),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _makeGetRequest() async {
    Response response = await get(_localhost());
    setState(() {
      var extractData  = jsonDecode(response.body);
      // var extractData = jsonDecode(res.body);
      serverResponse = extractData["forcast"];
    });
  }

  String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:3000/weather?address=cambodia';
    else // for iOS simulator
      return 'http://127.0.0.1:3000/weather?address=cambodia';
  }
}
