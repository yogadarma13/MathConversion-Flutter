import 'dart:math';

import 'package:flutter/material.dart';

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

// <============================== Persegi ===================================>

class Persegi extends StatefulWidget {
  @override
  _PersegiState createState() => _PersegiState();
}

class _PersegiState extends State<Persegi> {
  String luasPersegi = "0";

  TextEditingController persegiController = TextEditingController();

  void _hitungOnpress(String sisi) {
    setState(() {
      if (sisi.isEmpty) {
        luasPersegi = "0";
      } else {
        double rusuk = double.parse(sisi);
        double luas = rusuk * rusuk;

        luasPersegi = luas.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Persegi"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Image.asset('assets/images/persegi.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Sisi persegi: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: persegiController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai sisi persegi",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
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
                              if (persegiController.text.isEmpty) {
                                _snackBar(
                                    context, 'Masukkan nilai sisi persegi');
                              }
                              _hitungOnpress(persegiController.text);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ))),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Luas Persegi: "),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  luasPersegi,
                  style: TextStyle(color: Colors.black38, fontSize: 24.0),
                ),
              ),
            ],
          ),
        ));
  }
}

// <============================== Persegi Panjang ===================================>

class PersegiPanjang extends StatefulWidget {
  @override
  _PersegiPanjangState createState() => _PersegiPanjangState();
}

class _PersegiPanjangState extends State<PersegiPanjang> {
  String luasPersegiPanjang = "0";

  TextEditingController panjangController = TextEditingController();
  TextEditingController lebarController = TextEditingController();

  void _hitungOnpress(String panjang, String lebar) {
    setState(() {
      if (panjang.isEmpty || lebar.isEmpty) {
        luasPersegiPanjang = "0";
      } else {
        double sisiPanjang = double.parse(panjang);
        double sisiLebar = double.parse(lebar);
        double luas = sisiPanjang * sisiLebar;

        luasPersegiPanjang = luas.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Persegi Panjang"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/persegipanjang.png',
                    height: 160.0,
                    width: 280.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Panjang: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: panjangController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai panjang",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Lebar: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: lebarController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai panjang",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
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
                              if (panjangController.text.isEmpty &&
                                  lebarController.text.isEmpty) {
                                _snackBar(context,
                                    'Masukkan nilai panjang dan lebar');
                              } else if (panjangController.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai panjang');
                              } else if (lebarController.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai lebar');
                              }
                              _hitungOnpress(
                                  panjangController.text, lebarController.text);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ))),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Luas Persegi Panjang: "),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  luasPersegiPanjang,
                  style: TextStyle(color: Colors.black38, fontSize: 24.0),
                ),
              ),
            ],
          ),
        ));
  }
}

// <============================== Segitiga Sama Sisi ===================================>

class SegitigaSamaSisi extends StatefulWidget {
  @override
  _SegitigaSamaSisiState createState() => _SegitigaSamaSisiState();
}

class _SegitigaSamaSisiState extends State<SegitigaSamaSisi> {
  String luasSegitiga = "0";

  TextEditingController sisiController = TextEditingController();

  void _hitungOnpress(String s) {
    setState(() {
      if (s.isEmpty) {
        luasSegitiga = "0";
      } else {
        double sisi = double.parse(s);
        double luas = (sisi * sisi / 4) * sqrt(3);

        luasSegitiga = luas.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Segitiga Sama Sisi"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/samasisi.png',
                    height: 210.0,
                    // width: 280.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Sisi segitiga: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: sisiController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai sisi segitiga",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
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
                              if (sisiController.text.isEmpty) {
                                _snackBar(
                                    context, 'Masukkan nilai sisi segitiga');
                              }
                              _hitungOnpress(sisiController.text);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ))),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Luas segitiga sama sisi: "),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  luasSegitiga,
                  style: TextStyle(color: Colors.black38, fontSize: 24.0),
                ),
              ),
            ],
          ),
        ));
  }
}

// <============================== Segitiga Sama Kaki ===================================>

class SegitigaSamaKaki extends StatefulWidget {
  @override
  _SegitigaSamaKakiState createState() => _SegitigaSamaKakiState();
}

class _SegitigaSamaKakiState extends State<SegitigaSamaKaki> {
  String luasSegitiga = "0";

  TextEditingController sisiAlasController = TextEditingController();
  TextEditingController sisiKakiController = TextEditingController();

  void _hitungOnpress(String alas, String kaki) {
    setState(() {
      if (alas.isEmpty || kaki.isEmpty) {
        luasSegitiga = "0";
      } else {
        double sisiAlas = double.parse(alas);
        double sisiKaki = double.parse(kaki);
        double setAlas = sisiAlas / 2;
        double tinggi = sqrt((sisiKaki * sisiKaki) - (setAlas * setAlas));
        double luas = 1 / 2 * sisiAlas * tinggi;

        luasSegitiga = luas.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Segitiga Sama Kaki"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/samakaki.png',
                    height: 210.0,
                    // width: 280.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Sisi alas segitiga: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: sisiAlasController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai sisi alas",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Sisi kaki segitiga: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: sisiKakiController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai sisi kaki",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
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
                              if (sisiAlasController.text.isEmpty &&
                                  sisiKakiController.text.isEmpty) {
                                _snackBar(context,
                                    'Masukkan nilai sisi alas dan kaki');
                              } else if (sisiAlasController.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai sisi alas');
                              } else if (sisiKakiController.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai sisi kaki');
                              }
                              _hitungOnpress(sisiAlasController.text,
                                  sisiKakiController.text);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ))),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Luas Persegi Panjang: "),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  luasSegitiga,
                  style: TextStyle(color: Colors.black38, fontSize: 24.0),
                ),
              ),
            ],
          ),
        ));
  }
}

// <============================== Segitiga Siku - Siku ===================================>

class SegitigaSikuSiku extends StatefulWidget {
  @override
  _SegitigaSikuSikuState createState() => _SegitigaSikuSikuState();
}

class _SegitigaSikuSikuState extends State<SegitigaSikuSiku> {
  String luasSegitiga = "0";

  TextEditingController sisiAlasController = TextEditingController();
  TextEditingController sisiTinggiController = TextEditingController();

  void _hitungOnpress(String alas, String tinggi) {
    setState(() {
      if (alas.isEmpty || tinggi.isEmpty) {
        luasSegitiga = "0";
      } else {
        double sisiAlas = double.parse(alas);
        double sisiTinggi = double.parse(tinggi);
        double luas = 1 / 2 * sisiAlas * sisiTinggi;

        luasSegitiga = luas.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Segitiga Siku-siku"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/siku_siku.png',
                    height: 210.0,
                    // width: 280.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Sisi alas segitiga: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: sisiAlasController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai sisi alas",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Sisi tinggi segitiga: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: sisiTinggiController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai sisi tinggi",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
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
                              if (sisiAlasController.text.isEmpty &&
                                  sisiTinggiController.text.isEmpty) {
                                _snackBar(context,
                                    'Masukkan nilai sisi alas dan tinggi');
                              } else if (sisiAlasController.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai sisi alas');
                              } else if (sisiTinggiController.text.isEmpty) {
                                _snackBar(
                                    context, 'Masukkan nilai sisi tinggi');
                              }
                              _hitungOnpress(sisiAlasController.text,
                                  sisiTinggiController.text);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ))),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Luas Persegi Panjang: "),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  luasSegitiga,
                  style: TextStyle(color: Colors.black38, fontSize: 24.0),
                ),
              ),
            ],
          ),
        ));
  }
}

// <============================== Segitiga Sembarang ===================================>

class SegitigaSembarang extends StatefulWidget {
  @override
  _SegitigaSembarangState createState() => _SegitigaSembarangState();
}

class _SegitigaSembarangState extends State<SegitigaSembarang> {
  String luasSegitiga = "0";

  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();
  TextEditingController cController = TextEditingController();

  void _hitungOnpress(String a, String b, String c) {
    setState(() {
      if (a.isEmpty || b.isEmpty || c.isEmpty) {
        luasSegitiga = "0";
      } else {
        double sisiA = double.parse(a);
        double sisiB = double.parse(b);
        double sisiC = double.parse(c);
        double s = (sisiA + sisiB + sisiC) / 2;

        double luas = sqrt(s * (s - sisiA) * (s - sisiB) * (s - sisiC));

        luasSegitiga = luas.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Segitiga Sembarang"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/sembarang.png',
                    height: 210.0,
                    // width: 280.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Sisi a segitiga: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: aController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai sisi a",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Sisi b segitiga: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: bController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai sisi b",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Sisi c segitiga: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: cController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai sisi c",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
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
                              if (aController.text.isEmpty &&
                                  bController.text.isEmpty &&
                                  cController.text.isEmpty) {
                                _snackBar(
                                    context, 'Masukkan nilai sisi a, b dan c');
                              } else if (aController.text.isEmpty &&
                                  bController.text.isEmpty) {
                                _snackBar(
                                    context, 'Masukkan nilai sisi a dan b');
                              } else if (aController.text.isEmpty &&
                                  cController.text.isEmpty) {
                                _snackBar(
                                    context, 'Masukkan nilai sisi a dan c');
                              } else if (bController.text.isEmpty &&
                                  cController.text.isEmpty) {
                                _snackBar(
                                    context, 'Masukkan nilai sisi b dan c');
                              } else if (aController.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai sisi a');
                              } else if (bController.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai sisi b');
                              } else if (cController.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai sisi c');
                              }
                              _hitungOnpress(aController.text, bController.text,
                                  cController.text);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ))),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Luas segitiga sembarang: "),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  luasSegitiga,
                  style: TextStyle(color: Colors.black38, fontSize: 24.0),
                ),
              ),
            ],
          ),
        ));
  }
}

// <============================== Lingkaran ===================================>

class Lingkaran extends StatefulWidget {
  @override
  _LingkaranState createState() => _LingkaranState();
}

class _LingkaranState extends State<Lingkaran> {
  bool _jariEnable = true;
  bool _diaEnable = true;
  double luas = 0;
  double phi = 22 / 7;
  String luasLingkaran = "0";

  TextEditingController jariController = TextEditingController();
  TextEditingController diaController = TextEditingController();

  void _hitungOnpress(String jari, String dia) {
    setState(() {
      if (jari.isEmpty && dia.isEmpty) {
        luas = 0;
      } else if (jari.isEmpty) {
        double diameter = double.parse(dia);
        luas = phi * diameter * diameter / 4;
      } else if (dia.isEmpty) {
        double jari2 = double.parse(jari);
        luas = phi * jari2 * jari2;
      }
      luasLingkaran = luas.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lingkaran"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/lingkaran.jpg',
                    // height: 160.0,
                    // width: 280.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Jari - jari:",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
              TextField(
                controller: jariController,
                enabled: _jariEnable,
                decoration:
                    InputDecoration(hintText: "Masukkan jari- jari lingkaran"),
                keyboardType: TextInputType.number,
                onChanged: (String jari) {
                  setState(() {
                    if (jari.isEmpty) {
                      _diaEnable = true;
                    } else {
                      _diaEnable = false;
                    }
                  });
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Diameter:",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
              TextField(
                controller: diaController,
                enabled: _diaEnable,
                decoration:
                    InputDecoration(hintText: "Masukkan diameter lingkaran"),
                keyboardType: TextInputType.number,
                onChanged: (String dia) {
                  setState(() {
                    if (dia.isEmpty) {
                      _jariEnable = true;
                    } else {
                      _jariEnable = false;
                    }
                  });
                },
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
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
                              if (jariController.text.isEmpty &&
                                  diaController.text.isEmpty) {
                                _snackBar(context,
                                    'Masukkan nilai jari-jari atau diameter');
                              }
                              _hitungOnpress(
                                  jariController.text, diaController.text);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ))),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Luas Lingkaran: "),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  luasLingkaran,
                  style: TextStyle(color: Colors.black38, fontSize: 24.0),
                ),
              ),
            ],
          ),
        ));
  }
}

// <============================== Jajar Genjang ===================================>

class JajarGenjang extends StatefulWidget {
  @override
  _JajarGenjangState createState() => _JajarGenjangState();
}

class _JajarGenjangState extends State<JajarGenjang> {
  TextEditingController alasController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();

  String luasJajarGenjang = "0";

  void _hitungOnpress(String a, String t) {
    setState(() {
      if (a.isEmpty || t.isEmpty) {
        luasJajarGenjang = "0";
      } else {
        double alas = double.parse(a);
        double tinggi = double.parse(t);

        double luas = alas * tinggi;

        luasJajarGenjang = luas.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Jajar Genjang"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/jajargenjang.png',
                    height: 160.0,
                    width: 240.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Alas jajar genjang:",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: alasController,
                decoration: InputDecoration(hintText: "Masukkan nilai alas"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Tinggi jajar genjang:",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: tinggiController,
                decoration: InputDecoration(hintText: "Masukkan nilai tinggi"),
                keyboardType: TextInputType.number,
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
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
                              if (alasController.text.isEmpty &&
                                  tinggiController.text.isEmpty) {
                                _snackBar(
                                    context, 'Masukkan nilai alas dan tinggi');
                              } else if (alasController.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai alas');
                              } else if (tinggiController.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai tinggi');
                              }
                              _hitungOnpress(
                                  alasController.text, tinggiController.text);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ))),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Luas Jajar Genjang: "),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  luasJajarGenjang,
                  style: TextStyle(color: Colors.black38, fontSize: 24.0),
                ),
              ),
            ],
          ),
        ));
  }
}

// <============================== Belah Ketupat ===================================>

class BelahKetupat extends StatefulWidget {
  @override
  _BelahKetupatState createState() => _BelahKetupatState();
}

class _BelahKetupatState extends State<BelahKetupat> {
  TextEditingController diagonal1Controller = TextEditingController();
  TextEditingController diagonal2Controller = TextEditingController();

  String luasBelahKetupat = "0";

  void _hitungOnpress(String dia1, String dia2) {
    setState(() {
      if (dia1.isEmpty || dia2.isEmpty) {
        luasBelahKetupat = "0";
      } else {
        double diagonal1 = double.parse(dia1);
        double diagonal2 = double.parse(dia2);

        double luas = 1 / 2 * diagonal1 * diagonal2;

        luasBelahKetupat = luas.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Belah Ketupat"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Image.asset('assets/images/belah_ketupat.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Diagonal 1:"),
              ),
              TextField(
                controller: diagonal1Controller,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai diagonal 1"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text("Diagonal 2:"),
              ),
              TextField(
                controller: diagonal2Controller,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai diagonal 2"),
                keyboardType: TextInputType.number,
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
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
                              if (diagonal1Controller.text.isEmpty &&
                                  diagonal2Controller.text.isEmpty) {
                                _snackBar(context,
                                    'Masukkan nilai diagonal 1 dan diagonal 2');
                              } else if (diagonal1Controller.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai diagonal 1');
                              } else if (diagonal2Controller.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai diagonal 2');
                              }
                              _hitungOnpress(diagonal1Controller.text,
                                  diagonal2Controller.text);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ))),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Luas Belah Ketupat: "),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  luasBelahKetupat,
                  style: TextStyle(color: Colors.black38, fontSize: 24.0),
                ),
              ),
            ],
          ),
        ));
  }
}

// <============================== Layang - layang ===================================>

class LayangLayang extends StatefulWidget {
  @override
  _LayangLayangState createState() => _LayangLayangState();
}

class _LayangLayangState extends State<LayangLayang> {
  TextEditingController diagonal1Controller = TextEditingController();
  TextEditingController diagonal2Controller = TextEditingController();

  String luasLayang = "0";

  void _hitungOnpress(String dia1, String dia2) {
    setState(() {
      if (dia1.isEmpty || dia2.isEmpty) {
        luasLayang = "0";
      } else {
        double diagonal1 = double.parse(dia1);
        double diagonal2 = double.parse(dia2);

        double luas = 1 / 2 * diagonal1 * diagonal2;

        luasLayang = luas.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Layang - layang"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Image.asset('assets/images/layang_layang.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Diagonal 1:"),
              ),
              TextField(
                controller: diagonal1Controller,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai diagonal 1"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text("Diagonal 2:"),
              ),
              TextField(
                controller: diagonal2Controller,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai diagonal 2"),
                keyboardType: TextInputType.number,
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
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
                              if (diagonal1Controller.text.isEmpty &&
                                  diagonal2Controller.text.isEmpty) {
                                _snackBar(context,
                                    'Masukkan nilai diagonal 1 dan diagonal 2');
                              } else if (diagonal1Controller.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai diagonal 1');
                              } else if (diagonal2Controller.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai diagonal 2');
                              }
                              _hitungOnpress(diagonal1Controller.text,
                                  diagonal2Controller.text);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ))),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Luas Layang - layang: "),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  luasLayang,
                  style: TextStyle(color: Colors.black38, fontSize: 24.0),
                ),
              ),
            ],
          ),
        ));
  }
}

//<============================== Trapesium =================================>

class Trapesium extends StatefulWidget {
  @override
  _TrapesiumState createState() => _TrapesiumState();
}

class _TrapesiumState extends State<Trapesium> {
  String luasTrapesium = "0";

  TextEditingController atasController = TextEditingController();
  TextEditingController bawahController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();

  void _hitungOnpress(String a, String b, String c) {
    setState(() {
      if (a.isEmpty || b.isEmpty || c.isEmpty) {
        luasTrapesium = "0";
      } else {
        double atas = double.parse(a);
        double bawah = double.parse(b);
        double tinggi = double.parse(c);

        double luas = 1 / 2 * (atas + bawah) * tinggi;

        luasTrapesium = luas.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Trapesium"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/trapesium.png',
                    height: 180.0,
                    // width: 280.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Sisi sejajar 1: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: atasController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai sisi sejajar 1",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Sisi sejajar 2: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: bawahController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai sisi sejajar 2",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Tinggi: ",
                  // style: TextStyle(fontSize: 16.0, color: Colors.black)
                ),
              ),
              TextField(
                controller: tinggiController,
                decoration: InputDecoration(
                  hintText: "Masukkan nilai tinggi",
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
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
                              if (atasController.text.isEmpty &&
                                  bawahController.text.isEmpty &&
                                  tinggiController.text.isEmpty) {
                                _snackBar(context,
                                    'Masukkan nilai sisi sejajar 1, sejajar 2 dan tinggi');
                              } else if (atasController.text.isEmpty &&
                                  bawahController.text.isEmpty) {
                                _snackBar(context,
                                    'Masukkan nilai sisi sejajar 1 dan sejajar 2');
                              } else if (atasController.text.isEmpty &&
                                  tinggiController.text.isEmpty) {
                                _snackBar(context,
                                    'Masukkan nilai sisi sejajar 1 dan tinggi');
                              } else if (bawahController.text.isEmpty &&
                                  tinggiController.text.isEmpty) {
                                _snackBar(context,
                                    'Masukkan nilai sisi sejajar 2 dan tinggi');
                              } else if (atasController.text.isEmpty) {
                                _snackBar(
                                    context, 'Masukkan nilai sisi sejajar 1');
                              } else if (bawahController.text.isEmpty) {
                                _snackBar(
                                    context, 'Masukkan nilai sisi sejajar 2');
                              } else if (tinggiController.text.isEmpty) {
                                _snackBar(context, 'Masukkan nilai tinggi');
                              }
                              _hitungOnpress(atasController.text,
                                  bawahController.text, tinggiController.text);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ))),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Luas Trapesium: "),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  luasTrapesium,
                  style: TextStyle(color: Colors.black38, fontSize: 24.0),
                ),
              ),
            ],
          ),
        ));
  }
}
