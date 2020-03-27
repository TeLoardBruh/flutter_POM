import 'package:flutter/material.dart';
//

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: Text('Some Title'),
      // ),
      body: new CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Icon(Icons.arrow_back),
            // title: new Center(child: new Text("Sliver")),
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              background: Image.network("https://placeimg.com/480/320/any"),
            ),
          ),
          new SliverList(
            delegate: new SliverChildBuilderDelegate(
              (context, index) => new Card(
                child: new Container(
                  padding: EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            new NetworkImage("http://i.pravatar.cc/300"),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("I am the card content !")
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
