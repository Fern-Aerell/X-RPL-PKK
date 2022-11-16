import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:mypgri/screen/profil_screen.dart';
import 'package:mypgri/screen/tab_informasi_screen.dart';
import 'package:mypgri/system/data_informasi.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../system/tambahan.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController kolomPencarianController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(milliseconds: 700),
      () {
        if (welcome) {
          showDialog(
            context: context,
            builder: (context) => WelcomePopup(),
          );
          welcome = false;
        }
      },
    );
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
                  case 2:
                    Navigator.of(context).pushReplacementNamed("/profil");
                    break;
                  case 3:
                    Navigator.of(context).pushReplacementNamed("/guru");
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
          child: Column(children: [
            KolomPencarian(
              controller: kolomPencarianController,
              onPressed: () {
                FocusScope.of(context).unfocus();
                setState(() {
                  if (kolomPencarianController.text != null ||
                      kolomPencarianController.text != "") {
                    scrollController.animateTo(240,
                        duration: Duration(milliseconds: 700),
                        curve: Curves.fastOutSlowIn);
                  }
                });
              },
            ),
            Expanded(
              child: ListView(
                controller: scrollController,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PortalButton(
                        color: HexColor("73e4e7"),
                        icon: Icon(Icons.person_pin_rounded),
                        title: "PPDB Online",
                        onTap: () {
                          launchURL("smkpgripekanbaru.sch.id",
                              "ppdb-smk-pgri-pekanbaru/");
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PortalButton(
                        color: HexColor("f5ea98"),
                        icon: Icon(Icons.file_copy_outlined),
                        title: "Ujian Online",
                        onTap: () {
                          notifDoang(context, "Fitur belum tersedia.", 700);
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PortalButton(
                        color: HexColor("a5ffe3"),
                        icon: Icon(Icons.notes),
                        title: "Rapor Online",
                        onTap: () {
                          notifDoang(context, "Fitur belum tersedia.", 700);
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PortalButton(
                        color: HexColor("fea0c5"),
                        icon: Icon(Icons.person_sharp),
                        title: "eLearning",
                        onTap: () {
                          notifDoang(context, "Fitur belum tersedia.", 700);
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PortalButton(
                        color: HexColor("97fab0"),
                        icon: Icon(Icons.book),
                        title: "Perpustakaan",
                        onTap: () {
                          notifDoang(context, "Fitur belum tersedia.", 700);
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PortalButton(
                        color: HexColor("f5ea98"),
                        icon: Icon(Icons.surround_sound_rounded),
                        title: "Pengumuman",
                        onTap: () {
                          launchURL("smkpgripekanbaru.sch.id",
                              "pengumuman-kelulusan-smk-pgri-pekanbaru-2021/");
                        },
                      )
                    ],
                  ),
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
                        "Informasi Terbaru",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  for (int i = 0; i < DataInformasi.length; i++) ...[
                    //Cek apakah kolom kosong atau tidak
                    if (kolomPencarianController.text != "" ||
                        kolomPencarianController.text != null) ...[
                      //jika kolom tidak kosong
                      if (DataInformasi[i]['judul']
                          .toString()
                          .toLowerCase()
                          .contains(kolomPencarianController.text)) ...[
                        TabInformasi(
                          pathImage: DataInformasi[i]['foto'][1],
                          judul: DataInformasi[i]['judul'],
                          status: DataInformasi[i]['status'],
                          isi: DataInformasi[i]['isi'],
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                TabInformasiScreen(DataInformasiIndex: i),
                          )),
                        ),
                      ] else ...[
                        if (DataInformasi[i]['status']
                            .toString()
                            .toLowerCase()
                            .contains(kolomPencarianController.text)) ...[
                          TabInformasi(
                            pathImage: DataInformasi[i]['foto'][1],
                            judul: DataInformasi[i]['judul'],
                            status: DataInformasi[i]['status'],
                            isi: DataInformasi[i]['isi'],
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  TabInformasiScreen(DataInformasiIndex: i),
                            )),
                          )
                        ] else ...[
                          if (DataInformasi[i]['isi']
                              .toString()
                              .toLowerCase()
                              .contains(kolomPencarianController.text)) ...[
                            TabInformasi(
                              pathImage: DataInformasi[i]['foto'][1],
                              judul: DataInformasi[i]['judul'],
                              status: DataInformasi[i]['status'],
                              isi: DataInformasi[i]['isi'],
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    TabInformasiScreen(DataInformasiIndex: i),
                              )),
                            )
                          ]
                        ]
                      ]
                    ]
                  ],
                ],
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            launchURL("wa.me", "6285278527425");
          },
          child: Icon(Icons.whatsapp),
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

class KolomPencarian extends StatelessWidget {
  TextEditingController controller;
  Function() onPressed;
  KolomPencarian(
      {super.key, required this.controller, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromARGB(255, 170, 170, 170))),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                onPressed();
              },
              decoration: InputDecoration(
                  hintText: "Cari...",
                  contentPadding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 13, top: 10),
                  border: InputBorder.none),
            ),
          ),
          Container(
            width: 2,
            height: 25,
            color: Color.fromARGB(255, 154, 154, 154),
          ),
          SizedBox(
            width: 5,
          ),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: () {
              onPressed();
            },
            icon: Icon(Icons.search),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

class PortalButton extends StatelessWidget {
  Color color;
  Icon icon;
  String title;
  Function() onTap;

  BorderRadius _borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      topLeft: Radius.circular(9),
      bottomRight: Radius.circular(9));

  PortalButton({
    required this.color,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: Material(
          color: color,
          borderRadius: _borderRadius,
          child: InkWell(
            borderRadius: _borderRadius,
            onTap: () {
              onTap();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon.icon,
                  size: 35,
                  color: HexColor("392371"),
                ),
                Text(
                  "$title",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: HexColor("392371")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabInformasi extends StatelessWidget {
  String pathImage;
  String judul;
  String status;
  String isi;
  Function() onTap;

  TabInformasi({
    required this.pathImage,
    required this.judul,
    required this.status,
    required this.isi,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 210,
                width: 500,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    pathImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                judul,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                status,
                style: TextStyle(color: Color.fromARGB(255, 182, 182, 182)),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                isi,
                style: TextStyle(fontSize: 16),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomePopup extends StatelessWidget {
  const WelcomePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(19)),
        child: Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 320,
                width: 500,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/kepsek-smk-pgri.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Selamat datang",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Bismillah. Assalamu’alaikum Warahmatullah Wabarakatuh. Puji syukur kepada Allah SWT yang telah memberikan berbagai kenikmatan kepada kita dan atas rahmat-Nya dan kuasa-Nya pula aplikasi sekolah SMK PGRI Kota Pekanbaru Prop. Riau ini dapat dipublikasi dan dipergunakan sebagaimana mestinya. Dengan adanya aplikasi ini diharapkan dapat memberikan informasi keberadaan sekolah kami yang lebih akurat kepada masyarakat luas. Informasi yang disajikan berupa profil sekolah, fasilitas yang tersedia dan informasi penting lainnya.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Drs. Shofrudin",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 197, 43, 32))),
              SizedBox(
                height: 10,
              ),
              Text("Kepala Sekolah"),
              SizedBox(
                height: 11,
              ),
              SizedBox(
                  height: 45,
                  width: 340,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Ya",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
