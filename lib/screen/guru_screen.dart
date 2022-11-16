import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:mypgri/screen/home_screen.dart';
import 'package:mypgri/screen/tab_informasi_screen.dart';
import 'package:mypgri/system/data_guru.dart';
import 'package:mypgri/system/data_informasi.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GuruScreen extends StatefulWidget {
  GuruScreen({super.key});

  @override
  State<GuruScreen> createState() => _GuruScreenState();
}

class _GuruScreenState extends State<GuruScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          titleSpacing: -10,
          title: MyPGRIAppBarLogo(),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                switch (value) {
                  case 1:
                    Navigator.of(context).pushReplacementNamed("/home");
                    break;
                  case 2:
                    Navigator.of(context).pushReplacementNamed("/profil");
                    break;
                  case 3:
                    break;
                  case 4:
                    Navigator.of(context).pushReplacementNamed("/pegawai");
                    break;
                  case 5:
                  Navigator.of(context).pushReplacementNamed("/xrpl");
                    break;
                  default:
                }
              },
              child: Icon(
                Icons.dehaze,
                color: Colors.black,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Home"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Profil"),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text("Guru"),
                  value: 3,
                ),
                PopupMenuItem(
                  child: Text("Pegawai"),
                  value: 4,
                ),
                PopupMenuItem(
                  child: Text("Kelas X Rpl"),
                  value: 5,
                )
              ],
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: HexColor("cd282c"),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Center(
                child: Text(
                  "Data Pendidik Sekolah",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            for (int i = 0; i < DataGuru.length; i++) ...[
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        DataGuru[i]['foto'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      DataGuru[i]['nama'],
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(DataGuru[i]['guru'], style: TextStyle(fontSize: 15)),
                  ],
                ),
              )
            ]
          ]),
        ));
  }
}

class MyPGRIAppBarLogo extends StatelessWidget {
  const MyPGRIAppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset("assets/logosmkpgripku.png"),
      horizontalTitleGap: 5,
      visualDensity: VisualDensity.comfortable,
      title: Text(
        "SMK PGRI",
        style: TextStyle(
            color: HexColor("cd282c"),
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
      subtitle: Text("PEKANBARU",
          style: TextStyle(
              color: HexColor("23884b"),
              fontWeight: FontWeight.bold,
              fontSize: 14)),
    );
  }
}
