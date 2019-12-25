import 'package:flutter/material.dart';
import 'suhu.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Suhu(),
//     routes: {
//       '/celcius' : (context) => MyApp(),
//     },
//   ));
// }

class Suhu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Menghitung Suhu",
                style: TextStyle(fontSize: 22.0, color: Colors.blue),
                textAlign: TextAlign.center),
            Padding(
              padding: EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
              child: Text(
                "Suhu awal: ",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.blue[400],
                ),
                textAlign: TextAlign.start,
              ),
            ),
            // FlatButton(
            //     child: Text(
            //       "Celcius",
            //       style: TextStyle(
            //         color: Colors.black,
            //       ),
            //       textAlign: TextAlign.start,
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => Celcius(),
            //         ),
            //       );
            //       // Navigator.pushNamed(context, '/celcius');
            //     }),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Celcius()));
              },
              child: SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Text(
                    'Celcius',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Fahreinheit()));
              },
              child: SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Text(
                    "Fahreinheit",
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Reamur()));
              },
              child: SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Text(
                    "Reamur",
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Kelvin()));
              },
              child: SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Text(
                    "Kelvin",
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

// class PilihanSuhu extends StatelessWidget {

//   PilihanSuhu({
//     this.tulisan, this.namaClass
//   });

//   final String tulisan;
//   final String namaClass;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child:
//         FlatButton(
//             child: Text(
//               tulisan,
//               style: TextStyle(
//                 color: Colors.black,
//               ),
//             ),
//             onPressed: () {
//               Navigator.pushNamed(context, namaClass);
//             }
//         )
//     );
//   }
// }
