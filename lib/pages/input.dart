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
  final TextCtrl = new TextEditingController();
  String inputStr = '';
  bool enabled = false;
  bool expend = false;
  bool check = false;

  String radioValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Input Widgets"),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // user Text Field
            new TextField(
              decoration: new InputDecoration(hintText: 'Write something here'),
              onChanged: (String textinput) {
                setState(
                  () {
                    inputStr = textinput;
                    inputStr = TextCtrl.text.length.toString();
                  },
                );
              },
              controller: TextCtrl,
            ),
            new Text(inputStr),

            // Switch button
            new Switch(
              onChanged: (bool val) {
                setState(
                  () {
                    enabled = val;
                    // print(enabled);
                  },
                );
              },
              activeColor: Colors.green,
              activeTrackColor: Colors.greenAccent[400],
              value: enabled,
            ),

            // expan List 
            new ExpansionPanelList(
              expansionCallback: (i, bool val) {
                setState(() {
                  expend = !val;
                });
              },
              children: [
                new ExpansionPanel(
                  body: new Container(
                    padding: EdgeInsets.all(20.0),
                    child: new Text("Hello"),
                  ),
                  headerBuilder: (BuildContext context, bool val) {
                    return new Center(
                      child: new Text(
                        "Tap on meh",
                        style: new TextStyle(fontSize: 18.0),
                      ),
                    );
                  },
                  isExpanded: expend,
                ),
              ],
            ),

            // check box
            new Checkbox(onChanged: (bool val) {
              setState(() {
                check = val;
              });
            },
            value: check,
            activeColor: Colors.green,
            ),
            new Row(
              children: <Widget>[
                new Radio(onChanged: (String val){
                  
                  setState(() {
                    radioValue = val;  
                  });
                },
                activeColor: Colors.red,
                value: 'First',
                groupValue: radioValue,
                ),
                                new Radio(onChanged: (String val){
                  
                  setState(() {
                    radioValue = val;  
                  });
                },
                activeColor: Colors.green,
                value: 'Second',
                groupValue: radioValue,
                ),
                                new Radio(onChanged: (String val){
                  
                  setState(() {
                    radioValue = val;  
                  });
                },
                activeColor: Colors.blue,
                value: 'Third',
                groupValue: radioValue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
