import 'package:flutter/material.dart';
import 'luas.dart';
// void main(){
//   runApp(Luas());
// }

class Luas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Menghitung Luas",
                style: TextStyle(fontSize: 22.0, color: Colors.blue),
                textAlign: TextAlign.center),
            Container(
              padding: EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
              child: Text(
                "Bangun datar:",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.blue[400],
                ),
                textAlign: TextAlign.start,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Persegi()));
              },
              child: SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Text(
                    'Persegi',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PersegiPanjang()));
              },
              child: SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Text(
                    'Persegi panjang',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _macamSegitiga(context);
              },
              child: SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Text(
                    'Segitiga',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Lingkaran()));
              },
              child: SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Text(
                    'Lingkaran',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JajarGenjang()));
              },
              child: SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Text(
                    'Jajar genjang',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BelahKetupat()));
              },
              child: SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Text(
                    'Belah ketupat',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LayangLayang()));
              },
              child: SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Text(
                    'Layang - layang',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Trapesium()));
              },
              child: SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Text(
                    'Trapesium',
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

Future<void> _macamSegitiga(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Text(
          'Segitiga',
          textAlign: TextAlign.center,
          // style: TextStyle(decoration: TextDecoration.underline)
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                "Pilihan Segitiga:",
                style: TextStyle(fontSize: 12.0),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: GestureDetector(
                  child: Text("Segitiga sama sisi"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SegitigaSamaSisi(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  child: Text("Segitiga sama kaki"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SegitigaSamaKaki(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  child: Text("Segitiga siku-siku"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SegitigaSikuSiku(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  child: Text("Segitiga sembarang"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SegitigaSembarang(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Batal'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
