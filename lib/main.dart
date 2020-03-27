import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './pages/profile.dart';

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
                  builder: (BuildContext context) => new ProfilePage(
                    data[i],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// class ProfilePage extends StatelessWidget {
//   ProfilePage(this.data);
//   final data;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: new Text("Contact List"),
//       ),
//       body: new Center(
//         child: new Container(
//           width: 150.0,
//           height: 150.0,
//           decoration: new BoxDecoration(
//               color: const Color(0xff7c94b6),
//               image: new DecorationImage(
//                 image: new NetworkImage(
//                   data["picture"]["thumbnail"],
//                 ),
//                 fit: BoxFit.cover,
//               ),
//               borderRadius: new BorderRadius.all(
//                 new Radius.circular(75.0),
//               ),
//               border: new Border.all(color: Colors.red, width: 4.0)),
//         ),
//       ),
//     );
//   }
// }
