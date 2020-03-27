import 'package:flutter/material.dart';

// here import the related Page in that all
// import 'package:pom_for_use/pages/firstpage.dart';
// import 'package:pom_for_use/pages/secondpage.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
// here is to use the tab
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // tab bar on top
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.teal,
        title: new Text("Template For Flutter"),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.access_alarm),
            ),
            new Tab(
              icon: new Icon(Icons.accessible_forward),
            )
          ],
        ),
      ),
      // tab bar that buttom
      bottomNavigationBar: Material(
        color: Colors.teal,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.access_alarm),
            ),
            new Tab(
              icon: new Icon(Icons.accessible_forward),
            )
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          // after import called it here
          // new FirstPage(),
          // new SecondPage(),
        ],
      ),
    );
  }
}
