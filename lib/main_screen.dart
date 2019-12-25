import 'package:flutter/material.dart';
import './tab_suhu.dart' as suhu;
import './tab_luas.dart' as luas;
import './tab_volume.dart' as volume;

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<bool> _showDialogExit() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('No'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              new FlatButton(
                child: new Text('Yes'),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _showDialogExit,
        child: MaterialApp(
          home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text("Math Conversion"),
                centerTitle: true,
                leading: new Container(),
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(text: "Suhu"),
                    Tab(text: "Luas"),
                    Tab(text: "Volume"),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[suhu.Suhu(), luas.Luas(), volume.Volume()],
              ),
            ),
          ),
        ));
  }
}
