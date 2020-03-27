import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Center(child: new Text("Testing")),
        ),
        body: _MyList());
  }
}

class _MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: const EdgeInsets.all(4.0),
      itemBuilder: (context, i) {
        return new ListTile(
          title: new Text("Some Username"),
          subtitle: new Text("Online",
              style: new TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.green)),
          leading: const Icon(Icons.face),
          trailing: new RaisedButton(
              child: new Text("Remove"),
              onPressed: () {
                deleteDialog(context).then(
                  (value) {
                    print('Value is $value');
                  },
                );
              }),
        );
      },
    );
  }
}

Future<bool> deleteDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text('Are you sure?'),
        actions: <Widget>[
          new FlatButton(
            child: new Text("yes"),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          new FlatButton(
            child: new Text("no"),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          )
        ],
      );
    },
  );
}
