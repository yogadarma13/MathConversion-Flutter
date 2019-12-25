import 'dart:math';

import 'package:flutter/cupertino.dart';
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

//<================================== KUBUS ======================================>

class Kubus extends StatefulWidget {
  @override
  _KubusState createState() => _KubusState();
}

class _KubusState extends State<Kubus> {
  TextEditingController rusukController = new TextEditingController();
  String volumeKubus = "0";

  void _hitungOnpress(String r) {
    setState(() {
      if (r.isEmpty) {
        volumeKubus = "0";
      } else {
        double rusuk = double.parse(r);
        double volume = rusuk * rusuk * rusuk;

        volumeKubus = volume.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kubus"),
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
                      'assets/images/kubus.png',
                      height: 240.0,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Rusuk kubus:"),
              ),
              TextField(
                controller: rusukController,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai rusuk kubus"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Builder(
                  builder: (context) => RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    color: Colors.blue,
                    child: Text(
                      "Hitung",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (rusukController.text.isEmpty) {
                        _snackBar(context, "Masukkan nilai rusuk kubus");
                      }
                      _hitungOnpress(rusukController.text);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Volume kubus:"),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  volumeKubus,
                  style: TextStyle(color: Colors.black38, fontSize: 24.0),
                ),
              )
            ],
          ),
        ));
  }
}

//<================================= BALOK ==================================>
class Balok extends StatefulWidget {
  @override
  _BalokState createState() => _BalokState();
}

class _BalokState extends State<Balok> {
  TextEditingController panjangController = new TextEditingController();
  TextEditingController lebarController = new TextEditingController();
  TextEditingController tinggiController = new TextEditingController();

  String volumeBalok = "0";

  void _hitungOnpress(String panjang, String lebar, String tinggi) {
    setState(() {
      if (panjang.isEmpty || lebar.isEmpty || tinggi.isEmpty) {
        volumeBalok = "0";
      } else {
        double p = double.parse(panjang);
        double l = double.parse(lebar);
        double t = double.parse(tinggi);

        double volume = p * l * t;

        volumeBalok = volume.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Balok"),
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
                    'assets/images/balok.png',
                    height: 200.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Panjang balok:"),
              ),
              TextField(
                controller: panjangController,
                decoration: InputDecoration(hintText: "Masukkan nilai panjang"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text("Lebar balok:"),
              ),
              TextField(
                controller: lebarController,
                decoration: InputDecoration(hintText: "Masukkan nilai lebar"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text("Tinggi balok:"),
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
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    color: Colors.blue,
                    child: Text(
                      "Hitung",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (panjangController.text.isEmpty &&
                          lebarController.text.isEmpty &&
                          tinggiController.text.isEmpty) {
                        _snackBar(context,
                            "Masukkan nilai panjang, lebar dan tinggi balok");
                      } else if (panjangController.text.isEmpty &&
                          lebarController.text.isEmpty) {
                        _snackBar(
                            context, "Masukkan nilai panjang dan lebar balok");
                      } else if (panjangController.text.isEmpty &&
                          tinggiController.text.isEmpty) {
                        _snackBar(
                            context, "Masukkan nilai panjang dan tinggi balok");
                      } else if (lebarController.text.isEmpty &&
                          tinggiController.text.isEmpty) {
                        _snackBar(
                            context, "Masukkan nilai lebar dan tinggi balok");
                      } else if (panjangController.text.isEmpty) {
                        _snackBar(context, "Masukkan nilai panjang balok");
                      } else if (lebarController.text.isEmpty) {
                        _snackBar(context, "Masukkan nilai lebar balok");
                      } else if (tinggiController.text.isEmpty) {
                        _snackBar(context, "Masukkan nilai tinggi balok");
                      }
                      _hitungOnpress(panjangController.text,
                          lebarController.text, tinggiController.text);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Volume balok:"),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(volumeBalok,
                    style: TextStyle(color: Colors.black38, fontSize: 24.0)),
              )
            ],
          ),
        ));
  }
}

//<================================= TABUNG ==================================>
class Tabung extends StatefulWidget {
  @override
  _TabungState createState() => _TabungState();
}

class _TabungState extends State<Tabung> {
  TextEditingController diaController = new TextEditingController();
  TextEditingController jariController = new TextEditingController();
  TextEditingController tinggiController = new TextEditingController();

  bool _jariEnable = true;
  bool _diaEnable = true;
  double phi = 22 / 7;
  double volume = 0;
  String volumeTabung = "0";

  void _hitungOnpress(String dia, String jari, String tinggi) {
    setState(() {
      if (dia.isEmpty && jari.isEmpty) {
        volume = 0;
      } else if (tinggi.isEmpty) {
        volume = 0;
      } else if (dia.isEmpty) {
        double j = double.parse(jari);
        double t = double.parse(tinggi);
        volume = phi * j * j * t;
      } else if (jari.isEmpty) {
        double d = double.parse(dia);
        double t = double.parse(tinggi);
        volume = phi * (d / 2) * (d / 2) * t;
      }
      volumeTabung = volume.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tabung"),
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
                    'assets/images/silinder.png',
                    height: 240.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Diameter alas tabung:"),
              ),
              TextField(
                controller: diaController,
                enabled: _diaEnable,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai diameter"),
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
                child: Text("Jari-jari alas tabung:"),
              ),
              TextField(
                controller: jariController,
                enabled: _jariEnable,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai jari-jari"),
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
                child: Text("Tinggi tabung:"),
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
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child:
                              Text("Hitung", style: TextStyle(fontSize: 18.0)),
                          textColor: Colors.white,
                          onPressed: () {
                            if (diaController.text.isEmpty &&
                                jariController.text.isEmpty &&
                                tinggiController.text.isEmpty) {
                              _snackBar(context,
                                  "Masukkan nilai diameter atau jari - jari dan tinggi tabung");
                            } else if (diaController.text.isEmpty &&
                                jariController.text.isEmpty) {
                              _snackBar(context,
                                  "Masukkan nilai diameter atau jari - jari tabung");
                            } else if (tinggiController.text.isEmpty) {
                              _snackBar(
                                  context, "Masukkan nilai tinggi tabung");
                            }
                            _hitungOnpress(diaController.text,
                                jariController.text, tinggiController.text);
                          },
                        )),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Volume tabung:"),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(volumeTabung,
                    style: TextStyle(color: Colors.black38, fontSize: 24.0)),
              )
            ],
          ),
        ));
  }
}

//<================================= KERUCUT ==================================>
class Kerucut extends StatefulWidget {
  @override
  _KerucutState createState() => _KerucutState();
}

class _KerucutState extends State<Kerucut> {
  TextEditingController diaController = new TextEditingController();
  TextEditingController jariController = new TextEditingController();
  TextEditingController tinggiController = new TextEditingController();

  bool _jariEnable = true;
  bool _diaEnable = true;
  double phi = 22 / 7;
  double volume = 0;
  String volumeKerucut = "0";

  void _hitungOnpress(String dia, String jari, String tinggi) {
    setState(() {
      if (dia.isEmpty && jari.isEmpty) {
        volume = 0;
      } else if (tinggi.isEmpty) {
        volume = 0;
      } else if (dia.isEmpty) {
        double j = double.parse(jari);
        double t = double.parse(tinggi);
        volume = 1 / 3 * phi * j * j * t;
      } else if (jari.isEmpty) {
        double d = double.parse(dia);
        double t = double.parse(tinggi);
        volume = 1 / 3 * phi * (d / 2) * (d / 2) * t;
      }
      volumeKerucut = volume.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kerucut"),
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
                    'assets/images/kerucut.png',
                    height: 220.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Diameter alas kerucut:"),
              ),
              TextField(
                controller: diaController,
                enabled: _diaEnable,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai diameter"),
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
                child: Text("Jari-jari alas kerucut:"),
              ),
              TextField(
                controller: jariController,
                enabled: _jariEnable,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai jari-jari"),
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
                child: Text("Tinggi kerucut:"),
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
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child:
                              Text("Hitung", style: TextStyle(fontSize: 18.0)),
                          textColor: Colors.white,
                          onPressed: () {
                            if (diaController.text.isEmpty &&
                                jariController.text.isEmpty &&
                                tinggiController.text.isEmpty) {
                              _snackBar(context,
                                  "Masukkan nilai diameter atau jari - jari dan tinggi kerucut");
                            } else if (diaController.text.isEmpty &&
                                jariController.text.isEmpty) {
                              _snackBar(context,
                                  "Masukkan nilai diameter atau jari - jari alas kerucut");
                            } else if (tinggiController.text.isEmpty) {
                              _snackBar(
                                  context, "Masukkan nilai tinggi kerucut");
                            }
                            _hitungOnpress(diaController.text,
                                jariController.text, tinggiController.text);
                          },
                        )),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Volume kerucut:"),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(volumeKerucut,
                    style: TextStyle(color: Colors.black38, fontSize: 24.0)),
              )
            ],
          ),
        ));
  }
}

//<================================= BOLA ==================================>
class Bola extends StatefulWidget {
  @override
  _BolaState createState() => _BolaState();
}

class _BolaState extends State<Bola> {
  bool _jariEnable = true;
  bool _diaEnable = true;
  double volume = 0;
  double phi = 22 / 7;
  String volumeBola = "0";

  TextEditingController jariController = TextEditingController();
  TextEditingController diaController = TextEditingController();

  void _hitungOnpress(String jari, String dia) {
    setState(() {
      if (jari.isEmpty && dia.isEmpty) {
        volume = 0;
      } else if (jari.isEmpty) {
        double d = double.parse(dia);
        volume = 4 / 3 * phi * (d / 2) * (d / 2) * (d / 2);
      } else if (dia.isEmpty) {
        double j = double.parse(jari);
        volume = 4 / 3 * phi * j * j * j;
      }
      volumeBola = volume.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bola"),
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
                    'assets/images/bola.png',
                    height: 200.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Diameter bola:"),
              ),
              TextField(
                controller: diaController,
                enabled: _diaEnable,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai diameter"),
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
                child: Text("Jari-jari bola:"),
              ),
              TextField(
                controller: jariController,
                enabled: _jariEnable,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai jari-jari"),
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
                margin: EdgeInsets.only(top: 16.0),
                child: Builder(
                    builder: (context) => RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child:
                              Text("Hitung", style: TextStyle(fontSize: 18.0)),
                          textColor: Colors.white,
                          onPressed: () {
                            if (jariController.text.isEmpty &&
                                diaController.text.isEmpty) {
                              _snackBar(context,
                                  'Masukkan nilai jari-jari atau diameter bola');
                            }
                            _hitungOnpress(
                                jariController.text, diaController.text);
                          },
                        )),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Volume bola:"),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(volumeBola,
                    style: TextStyle(color: Colors.black38, fontSize: 24.0)),
              )
            ],
          ),
        ));
  }
}

//<=================================== LIMAS SEGITIGA ================================>
class LimasSegitiga extends StatefulWidget {
  @override
  _LimasSegitigaState createState() => _LimasSegitigaState();
}

class _LimasSegitigaState extends State<LimasSegitiga> {
  TextEditingController sisiAlasController = new TextEditingController();
  TextEditingController tinggiAlasController = new TextEditingController();
  TextEditingController tinggiController = new TextEditingController();

  String volumeLimasSegitiga = "0";
  double volume = 0;

  void _hitungOnpress(String alas, String tinggiAlas, String tinggi) {
    setState(() {
      if (alas.isEmpty || tinggiAlas.isEmpty || tinggi.isEmpty) {
        volume = 0;
      } else {
        double a = double.parse(alas);
        double ta = double.parse(tinggiAlas);
        double t = double.parse(tinggi);

        volume = 1 / 3 * (1 / 2 * a * ta) * t;
      }

      volumeLimasSegitiga = volume.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Limas segitiga"),
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
                    'assets/images/limas_segitiga.png',
                    height: 240.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Sisi alas limas:"),
              ),
              TextField(
                controller: sisiAlasController,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai sisi alas"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Tinggi dari alas limas:"),
              ),
              TextField(
                controller: tinggiAlasController,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai tinggi alas"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text("Tinggi limas:"),
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
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child:
                              Text("Hitung", style: TextStyle(fontSize: 18.0)),
                          textColor: Colors.white,
                          onPressed: () {
                            if (sisiAlasController.text.isEmpty &&
                                tinggiAlasController.text.isEmpty &&
                                tinggiController.text.isEmpty) {
                              _snackBar(context,
                                  "Masukkan nilai sisi, tinggi alas dan tinggi limas");
                            } else if (sisiAlasController.text.isEmpty &&
                                tinggiAlasController.text.isEmpty) {
                              _snackBar(context,
                                  "Masukkan nilai sisi, dan tinggi alas limas");
                            } else if (sisiAlasController.text.isEmpty &&
                                tinggiController.text.isEmpty) {
                              _snackBar(context,
                                  "Masukkan nilai sisi alas dan tinggi limas");
                            } else if (tinggiAlasController.text.isEmpty &&
                                tinggiController.text.isEmpty) {
                              _snackBar(context,
                                  "Masukkan nilai tinggi alas dan tinggi limas");
                            } else if (sisiAlasController.text.isEmpty) {
                              _snackBar(
                                  context, "Masukkan nilai sisi alas limas");
                            } else if (tinggiAlasController.text.isEmpty) {
                              _snackBar(
                                  context, "Masukkan nilai tinggi alas limas");
                            } else if (tinggiController.text.isEmpty) {
                              _snackBar(context, "Masukkan nilai tinggi limas");
                            }
                            _hitungOnpress(
                                sisiAlasController.text,
                                tinggiAlasController.text,
                                tinggiController.text);
                          },
                        )),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Volume limas segitiga:"),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(volumeLimasSegitiga,
                    style: TextStyle(color: Colors.black38, fontSize: 24.0)),
              )
            ],
          ),
        ));
  }
}

//<=================================== LIMAS SEGIEMPAT ================================>
class LimasSegiempat extends StatefulWidget {
  @override
  _LimasSegiempatState createState() => _LimasSegiempatState();
}

class _LimasSegiempatState extends State<LimasSegiempat> {
  TextEditingController sisiController = new TextEditingController();
  TextEditingController tinggiController = new TextEditingController();

  String volumeLimas = "0";
  double volume = 0;

  void _hitungOnpress(String sisi, String tinggi) {
    setState(() {
      if (sisi.isEmpty || tinggi.isEmpty) {
        volume = 0;
      } else {
        double s = double.parse(sisi);
        double t = double.parse(tinggi);

        volume = 1 / 3 * (s * s) * t;
      }

      volumeLimas = volume.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Limas segiempat"),
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
                    'assets/images/limas_segiempat.png',
                    height: 240.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Sisi alas limas:"),
              ),
              TextField(
                controller: sisiController,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai sisi alas"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text("Tinggi limas:"),
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
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child:
                              Text("Hitung", style: TextStyle(fontSize: 18.0)),
                          textColor: Colors.white,
                          onPressed: () {
                            if (sisiController.text.isEmpty &&
                                tinggiController.text.isEmpty) {
                              _snackBar(context,
                                  "Masukkan nilai sisi alas dan tinggi limas");
                            } else if (sisiController.text.isEmpty) {
                              _snackBar(
                                  context, "Masukkan nilai sisi alas limas");
                            } else if (tinggiController.text.isEmpty) {
                              _snackBar(context, "Masukkan nilai tinggi limas");
                            }
                            _hitungOnpress(
                                sisiController.text, tinggiController.text);
                          },
                        )),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Volume limas segiempat:"),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(volumeLimas,
                    style: TextStyle(color: Colors.black38, fontSize: 24.0)),
              )
            ],
          ),
        ));
  }
}

//<================================== LIMAS SEGILIMA ==================================>
class LimasSegilima extends StatefulWidget {
  @override
  _LimasSegilimaState createState() => _LimasSegilimaState();
}

class _LimasSegilimaState extends State<LimasSegilima> {
  TextEditingController sisiController = new TextEditingController();
  TextEditingController tinggiController = new TextEditingController();

  String volumeLimas = "0";
  double volume = 0;

  void _hitungOnpress(String sisi, String tinggi) {
    setState(() {
      if (sisi.isEmpty || tinggi.isEmpty) {
        volume = 0;
      } else {
        double s = double.parse(sisi);
        double t = double.parse(tinggi);

        // volume = 1 / 3 * (1 / 4 * sqrt(5 * ( 5 + 2 * sqrt(5))) * s) * t;
        volume = 1 / 3 * 1.72048 * s * s * t;
      }
      volumeLimas = volume.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Limas segilima"),
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
                    'assets/images/limas_segilima.png',
                    height: 240.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Sisi alas limas:"),
              ),
              TextField(
                controller: sisiController,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai sisi alas"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text("Tinggi limas:"),
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
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    textColor: Colors.white,
                    child: Text("Hitung", style: TextStyle(fontSize: 18.0)),
                    onPressed: () {
                      if (sisiController.text.isEmpty &&
                          tinggiController.text.isEmpty) {
                        _snackBar(context,
                            "Masukkan nilai sisi alas dan tinggi limas");
                      } else if (sisiController.text.isEmpty) {
                        _snackBar(context, "Masukkan nilai sisi alas limas");
                      } else if (tinggiController.text.isEmpty) {
                        _snackBar(context, "Masukkan nilai tinggi limas");
                      }
                      _hitungOnpress(
                          sisiController.text, tinggiController.text);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Volume limas segilima"),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(volumeLimas,
                    style: TextStyle(color: Colors.black38, fontSize: 24.0)),
              )
            ],
          ),
        ));
  }
}

//<================================== LIMAS SEGIENAM ===================================>
class LimasSegienam extends StatefulWidget {
  @override
  _LimasSegienamState createState() => _LimasSegienamState();
}

class _LimasSegienamState extends State<LimasSegienam> {
  TextEditingController sisiController = new TextEditingController();
  TextEditingController tinggiController = new TextEditingController();

  String volumeLimas = "0";
  double volume = 0;

  void _hitungOnpress(String sisi, String tinggi) {
    setState(() {
      if (sisi.isEmpty || tinggi.isEmpty) {
        volume = 0;
      } else {
        double s = double.parse(sisi);
        double t = double.parse(tinggi);

        volume = 1 / 2 * s * s * t * sqrt(3);
      }
      volumeLimas = volume.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Limas segienam"),
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
                    'assets/images/limas_segienam.png',
                    height: 240.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Sisi alas limas:"),
              ),
              TextField(
                controller: sisiController,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai sisi alas"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text("Tinggi limas:"),
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
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    textColor: Colors.white,
                    child: Text("Hitung", style: TextStyle(fontSize: 18.0)),
                    onPressed: () {
                      if (sisiController.text.isEmpty &&
                          tinggiController.text.isEmpty) {
                        _snackBar(context,
                            "Masukkan nilai sisi alas dan tinggi limas");
                      } else if (sisiController.text.isEmpty) {
                        _snackBar(context, "Masukkan nilai sisi alas limas");
                      } else if (tinggiController.text.isEmpty) {
                        _snackBar(context, "Masukkan nilai tinggi limas");
                      }
                      _hitungOnpress(
                          sisiController.text, tinggiController.text);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Volume limas segienam"),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(volumeLimas,
                    style: TextStyle(color: Colors.black38, fontSize: 24.0)),
              )
            ],
          ),
        ));
  }
}

//<================================= PRISMA SEGITIGA ================================>
class PrismaSegitiga extends StatefulWidget {
  @override
  _PrismaSegitigaState createState() => _PrismaSegitigaState();
}

class _PrismaSegitigaState extends State<PrismaSegitiga> {
  TextEditingController sisiAlasController = new TextEditingController();
  TextEditingController tinggiAlasController = new TextEditingController();
  TextEditingController tinggiController = new TextEditingController();

  String volumePrisma = "0";
  double volume = 0;

  void _hitungOnpress(String sisi, String tinggiAlas, String tinggi) {
    setState(() {
      if (sisi.isEmpty || tinggiAlas.isEmpty || tinggi.isEmpty) {
        volume = 0;
      } else {
        double s = double.parse(sisi);
        double ta = double.parse(tinggiAlas);
        double t = double.parse(tinggi);
        volume = (1 / 2 * s * ta) * t;
      }

      volumePrisma = volume.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Prisma segitiga"),
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
                  child: Image.asset('assets/images/prisma_segitiga.png',
                      height: 260.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Sisi alas prisma:"),
              ),
              TextField(
                controller: sisiAlasController,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai sisi alas"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text("Tinggi alas prisma:"),
              ),
              TextField(
                controller: tinggiAlasController,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai tinggi alas"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text("Tinggi prisma:"),
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
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    textColor: Colors.white,
                    child: Text("Hitung", style: TextStyle(fontSize: 18.0)),
                    onPressed: () {
                      if (sisiAlasController.text.isEmpty &&
                          tinggiAlasController.text.isEmpty &&
                          tinggiController.text.isEmpty) {
                        _snackBar(context,
                            "Masukkan nilai sisi, tinggi alas dan tinggi prisma");
                      } else if (sisiAlasController.text.isEmpty &&
                          tinggiAlasController.text.isEmpty) {
                        _snackBar(context,
                            "Masukkan nilai sisi dan tinggi alas prisma");
                      } else if (sisiAlasController.text.isEmpty &&
                          tinggiController.text.isEmpty) {
                        _snackBar(context,
                            "Masukkan nilai sisi alas dan tinggi prisma");
                      } else if (tinggiAlasController.text.isEmpty &&
                          tinggiController.text.isEmpty) {
                        _snackBar(context,
                            "Masukkan nilai tinggi alas dan tinggi prisma");
                      } else if (sisiAlasController.text.isEmpty) {
                        _snackBar(context, "Masukkan nilai sisi alas prisma");
                      } else if (tinggiAlasController.text.isEmpty) {
                        _snackBar(context, "Masukkan nilai tinggi alas prisma");
                      } else if (tinggiController.text.isEmpty) {
                        _snackBar(context, "Masukkan nilai tinggi prisma");
                      }
                      _hitungOnpress(sisiAlasController.text,
                          tinggiAlasController.text, tinggiController.text);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Volume prisma segitiga"),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(volumePrisma,
                    style: TextStyle(color: Colors.black38, fontSize: 24.0)),
              )
            ],
          ),
        ));
  }
}

//<=============================== PRISMA SEGILIMA =================================>
class PrismaSegilima extends StatefulWidget {
  @override
  _PrismaSegilimaState createState() => _PrismaSegilimaState();
}

class _PrismaSegilimaState extends State<PrismaSegilima> {
  TextEditingController sisiAlasController = new TextEditingController();
  TextEditingController tinggiController = new TextEditingController();

  String volumePrisma = "0";
  double volume = 0;

  void _hitungOnpress(String alas, String tinggi) {
    setState(() {
      if (alas.isEmpty || tinggi.isEmpty) {
        volume = 0;
      } else {
        double a = double.parse(alas);
        double t = double.parse(tinggi);

        volume = 1.72048 * a * a * t;
      }
      volumePrisma = volume.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Prisma segilima"),
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
                    'assets/images/prisma_segilima.png',
                    height: 260.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Sisi alas prisma:"),
              ),
              TextField(
                controller: sisiAlasController,
                decoration:
                    InputDecoration(hintText: "Masukkan nilai sisi alas"),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text("Tinggi prisma:"),
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
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    textColor: Colors.white,
                    child: Text("Hitung", style: TextStyle(fontSize: 18.0)),
                    onPressed: () {
                      if (sisiAlasController.text.isEmpty &&
                          tinggiController.text.isEmpty) {
                        _snackBar(context,
                            "Masukkan nilai sisi alas dan tinggi prisma");
                      } else if (sisiAlasController.text.isEmpty) {
                        _snackBar(context, "Masukkan nilai sisi alas prisma");
                      } else if (tinggiController.text.isEmpty) {
                        _snackBar(context, "Masukkan nilai tinggi prisma");
                      }
                      _hitungOnpress(
                          sisiAlasController.text, tinggiController.text);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Volume prisma segilima"),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(volumePrisma,
                    style: TextStyle(color: Colors.black38, fontSize: 24.0)),
              )
            ],
          ),
        ));
  }
}

//<=============================== PRISMA SEGIENAM ==============================>
class PrismaSegienam extends StatefulWidget {
  @override
  _PrismaSegienamState createState() => _PrismaSegienamState();
}

class _PrismaSegienamState extends State<PrismaSegienam> {
  TextEditingController sisiAlasController = new TextEditingController();
  TextEditingController tinggiController = new TextEditingController();

  String volumePrisma = "0";
  double volume = 0;

  void _hitungOnpress(String alas, String tinggi) {
    setState(() {
      if (alas.isEmpty || tinggi.isEmpty) {
        volume = 0;
      } else {
        double a = double.parse(alas);
        double t = double.parse(tinggi);

        volume = (6 * (1 / 4 * a * a * sqrt(3))) * t;
      }
      volumePrisma = volume.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Prisma segienam"),
          backgroundColor: Colors.blue,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Center(
                        child: Image.asset(
                          'assets/images/prisma_segienam.png',
                          height: 260.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Text("Sisi alas prisma:"),
                    ),
                    TextField(
                      controller: sisiAlasController,
                      decoration:
                          InputDecoration(hintText: "Masukkan nilai sisi alas"),
                      keyboardType: TextInputType.number,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      child: Text("Tinggi prisma:"),
                    ),
                    TextField(
                      controller: tinggiController,
                      decoration:
                          InputDecoration(hintText: "Masukkan nilai tinggi"),
                      keyboardType: TextInputType.number,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Builder(
                        builder: (context) => RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          textColor: Colors.white,
                          child:
                              Text("Hitung", style: TextStyle(fontSize: 18.0)),
                          onPressed: () {
                            if (sisiAlasController.text.isEmpty &&
                                tinggiController.text.isEmpty) {
                              _snackBar(context,
                                  "Masukkan nilai sisi alas dan tinggi prisma");
                            } else if (sisiAlasController.text.isEmpty) {
                              _snackBar(
                                  context, "Masukkan nilai sisi alas prisma");
                            } else if (tinggiController.text.isEmpty) {
                              _snackBar(
                                  context, "Masukkan nilai tinggi prisma");
                            }
                            _hitungOnpress(
                                sisiAlasController.text, tinggiController.text);
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Text("Volume prisma segilima"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                      child: Text(volumePrisma,
                          style:
                              TextStyle(color: Colors.black38, fontSize: 24.0)),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
