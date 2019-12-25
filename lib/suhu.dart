import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Celcius(),
//   ));
// }

void _snackBar(BuildContext context, String pesan) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(pesan),
    duration: Duration(milliseconds: 2000),
    // action: SnackBarAction(
    // label: 'Undo',
    // onPressed: () {
    // // Scaffold.of(context).hideCurrentSnackBar;
    // },
    // )
  ));
}

// <-- Class Celcius -->
class Celcius extends StatefulWidget {
  @override
  _CelciusState createState() => _CelciusState();
}

class _CelciusState extends State<Celcius> {
  String fahrein = "0";
  String reamur = "0";
  String kelvin = "0";

  TextEditingController celciusControler = TextEditingController();

  void _hitungOnpress(String celcius) {
    setState(() {
      if (celcius.isEmpty) {
        fahrein = "0";
        reamur = "0";
        kelvin = "0";
      } else {
        double cel = double.parse(celcius);
        double fah = (9 / 5 * cel) + 32;
        double rea = 4 / 5 * cel;
        double kel = cel + 273.15;

        fahrein = fah.toString();
        reamur = rea.toString();
        kelvin = kel.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Celcius"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        // )
        // Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Suhu Celcius: ",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16.0, color: Colors.black)),
            TextField(
              controller: celciusControler,
              decoration: InputDecoration(
                hintText: "Masukkan nilai celcius",
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Builder(
                    builder: (context) => RaisedButton(
                          textColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text("Hitung",
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                          color: Colors.blue,
                          onPressed: () {
                            if (celciusControler.text.isEmpty) {
                              _snackBar(context, 'Masukkan nilai celcius');
                            }
                            _hitungOnpress(celciusControler.text);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ))

                //membuat tombol gradient
                // RaisedButton(
                //   onPressed: () {},
                //   textColor: Colors.white,
                //   child: Container(

                //     decoration: const BoxDecoration(
                //       color: Colors.blue,
                //       gradient: LinearGradient(
                //         colors:
                //         [Color(0xFF0D47A1), Color(0xFF42A5F5)],
                //       ),
                //     ),

                //     padding: const EdgeInsets.all(10.0),
                //     child: const Text('Gradient Button',
                //         style: TextStyle(fontSize: 20)),
                //   ),
                // ),
                ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text("Suhu Fahreinheit: "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                fahrein + " °F",
                style: TextStyle(color: Colors.black38, fontSize: 24.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Suhu Reamur: "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                reamur + " °R",
                style: TextStyle(color: Colors.black38, fontSize: 24.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Suhu Kelvin: "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                kelvin + " K",
                style: TextStyle(color: Colors.black38, fontSize: 24.0),
              ),
            )
          ],
        ),
      ),
      // ),
    );
  }
}

//<-- Class Fahreinheit -->

class Fahreinheit extends StatefulWidget {
  @override
  _FahreinheitState createState() => _FahreinheitState();
}

class _FahreinheitState extends State<Fahreinheit> {
  String celcius = "0";
  String reamur = "0";
  String kelvin = "0";

  TextEditingController fahreinControler = TextEditingController();

  void _hitungOnpress(String fahrein) {
    setState(() {
      if (fahrein.isEmpty) {
        celcius = "0";
        reamur = "0";
        kelvin = "0";
      } else {
        double fah = double.parse(fahrein);
        double cel = 5 / 9 * (fah - 32);
        double rea = 4 / 9 * (fah - 32);
        double kel = 5 / 9 * (fah - 32) + 273.15;

        celcius = cel.toString();
        reamur = rea.toString();
        kelvin = kel.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fahreinheit"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Suhu Fahreinheit: ",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16.0, color: Colors.black)),
            TextField(
              controller: fahreinControler,
              decoration: InputDecoration(
                hintText: "Masukkan nilai fahreinheit",
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Builder(
                    builder: (context) => RaisedButton(
                          textColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text("Hitung",
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                          color: Colors.blue,
                          onPressed: () {
                            if (fahreinControler.text.isEmpty) {
                              _snackBar(context, 'Masukkan nilai fahreinheit');
                            }
                            _hitungOnpress(fahreinControler.text);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ))),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text("Suhu Celcius: "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                celcius + " °C",
                style: TextStyle(color: Colors.black38, fontSize: 24.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Suhu Reamur: "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                reamur + " °R",
                style: TextStyle(color: Colors.black38, fontSize: 24.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Suhu Kelvin: "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                kelvin + " K",
                style: TextStyle(color: Colors.black38, fontSize: 24.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//<-- Reamur -->
class Reamur extends StatefulWidget {
  @override
  _ReamurState createState() => _ReamurState();
}

class _ReamurState extends State<Reamur> {
  String celcius = "0";
  String fahrein = "0";
  String kelvin = "0";

  TextEditingController reamurControler = TextEditingController();

  void _hitungOnpress(String reamur) {
    setState(() {
      if (reamur.isEmpty) {
        celcius = "0";
        fahrein = "0";
        kelvin = "0";
      } else {
        double rea = double.parse(reamur);
        double cel = 5 / 4 * rea;
        double fah = (9 / 4 * rea) + 32;
        double kel = (5 / 4 * rea) + 273.15;

        celcius = cel.toString();
        fahrein = fah.toString();
        kelvin = kel.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reamur"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Suhu Reamur: ",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16.0, color: Colors.black)),
            TextField(
              controller: reamurControler,
              decoration: InputDecoration(
                hintText: "Masukkan nilai reamur",
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Builder(
                    builder: (context) => RaisedButton(
                          textColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text("Hitung",
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                          color: Colors.blue,
                          onPressed: () {
                            if (reamurControler.text.isEmpty) {
                              _snackBar(context, 'Masukkan nilai reamur');
                            }
                            _hitungOnpress(reamurControler.text);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ))),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text("Suhu Celcius: "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                celcius + " °C",
                style: TextStyle(color: Colors.black38, fontSize: 24.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Suhu Fahreinheit: "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                fahrein + " °F",
                style: TextStyle(color: Colors.black38, fontSize: 24.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Suhu Kelvin: "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                kelvin + " K",
                style: TextStyle(color: Colors.black38, fontSize: 24.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//<-- Kelvin -->
class Kelvin extends StatefulWidget {
  @override
  _KelvinState createState() => _KelvinState();
}

class _KelvinState extends State<Kelvin> {
  String celcius = "0";
  String fahrein = "0";
  String reamur = "0";

  TextEditingController kelvinControler = TextEditingController();

  void _hitungOnpress(String kelvin) {
    setState(() {
      if (kelvin.isEmpty) {
        celcius = "0";
        fahrein = "0";
        reamur = "0";
      } else {
        double kel = double.parse(kelvin);
        double cel = kel - 273.12;
        double fah = 9 / 5 * (kel - 273.15) + 32;
        double rea = 4 / 5 * (kel - 273.15);

        celcius = cel.toString();
        fahrein = fah.toString();
        reamur = rea.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kelvin"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Suhu Kelvin: ",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16.0, color: Colors.black)),
            TextField(
              controller: kelvinControler,
              decoration: InputDecoration(
                hintText: "Masukkan nilai kelvin",
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Builder(
                    builder: (context) => RaisedButton(
                          textColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text("Hitung",
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                          color: Colors.blue,
                          onPressed: () {
                            if (kelvinControler.text.isEmpty) {
                              _snackBar(context, 'Masukkan nilai kelvin');
                            }
                            _hitungOnpress(kelvinControler.text);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ))),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text("Suhu Celcius: "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                celcius + " °C",
                style: TextStyle(color: Colors.black38, fontSize: 24.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Suhu Fahreinheit: "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                fahrein + " °F",
                style: TextStyle(color: Colors.black38, fontSize: 24.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Suhu Reamur: "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                reamur + " °R",
                style: TextStyle(color: Colors.black38, fontSize: 24.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
