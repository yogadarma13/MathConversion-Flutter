// import 'package:flutter/material.dart';
// import 'main_screen.dart';
// import 'dart:async';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => MainScreen(),
//         ),
//       );
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Image.asset(
//         'assets/images/logo.png',
//         height: 120.0,
//         width: 120.0,
//       ),
//     ));
//   }
// }

import 'package:flutter/material.dart';
import './tab_suhu.dart' as suhu;
import './tab_luas.dart' as luas;
import './tab_volume.dart' as volume;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime currentBackPressTime;

  Future<bool> _showDialogExit() {
    // return showDialog(
    //   context: context,
    //   builder: (context) => new AlertDialog(
    //         title: new Text('Are you sure?'),
    //         content: new Text('Do you want to exit an App'),
    //         actions: <Widget>[
    //           new FlatButton(
    //             child: new Text('No'),
    //             onPressed: () => Navigator.of(context).pop(false),
    //           ),
    //           new FlatButton(
    //             child: new Text('Yes'),
    //             onPressed: () => Navigator.of(context).pop(true),
    //           ),
    //         ],
    //       ),
    // );

    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Tekan sekali lagi untuk keluar");

      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _showDialogExit,
      child: DefaultTabController(
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
    );
  }
}
