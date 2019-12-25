import 'package:flutter/material.dart';
import 'volume.dart';

// void main(){
//   runApp(Volume());
// }

class Volume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Menghitung Volume",
            style: TextStyle(fontSize: 22.0, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Text("Bangun ruang:",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.blue[400],
                )),
          ),
          // FlatButton(
          //   child: Text("Kubus", style: TextStyle(color: Colors.black)),
          //   onPressed: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => Kubus()));
          //   },
          // ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Kubus()));
            },
            child: SizedBox(
              child: Container(
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                // decoration:
                //     BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  'Kubus',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Balok()));
            },
            child: SizedBox(
              child: Container(
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                // decoration:
                //     BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  'Balok',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Tabung()));
            },
            child: SizedBox(
              child: Container(
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Tabung",
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Kerucut()));
            },
            child: SizedBox(
              child: Container(
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Kerucut",
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Bola()));
            },
            child: SizedBox(
              child: Container(
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Bola",
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),

          InkWell(
            onTap: () {
              _macamLimas(context);
            },
            child: SizedBox(
              child: Container(
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Limas",
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),

          InkWell(
            onTap: () {
              _macamPrisma(context);
            },
            child: SizedBox(
              child: Container(
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Prisma",
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<void> _macamLimas(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Text(
          'Limas',
          textAlign: TextAlign.center,
          // style: TextStyle(decoration: TextDecoration.underline)
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                "Pilihan Limas:",
                style: TextStyle(fontSize: 12.0),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: GestureDetector(
                  child: Text("Limas segitiga"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LimasSegitiga(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  child: Text("Limas segiempat"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LimasSegiempat(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  child: Text("Limas segilima"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LimasSegilima(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  child: Text("Limas segienam"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LimasSegienam(),
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

Future<void> _macamPrisma(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(
            "Prisma",
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Pilihan Prisma:",
                  style: TextStyle(fontSize: 12.0),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: GestureDetector(
                    child: Text("Prisma segitiga"),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrismaSegitiga()));
                    },
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: GestureDetector(
                      child: Text("Prisma segilima"),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrismaSegilima()));
                      },
                    )),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    child: Text("Prisma segienam"),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrismaSegienam()));
                    },
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Batal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
