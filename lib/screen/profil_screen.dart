import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:mypgri/screen/home_screen.dart';
import 'package:mypgri/screen/tab_informasi_screen.dart';
import 'package:mypgri/system/data_informasi.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfilScreen extends StatefulWidget {
  ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
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
                  "Sekilas Sekolah",
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
            Text(
              "SMK PGRI Pekanbaru merupakan SMK yang terletak di jantung kota Pekanbaru berdiri sejak tahun 1961 dibawah naungan YPLP PGRI Riau, memiliki 8 Jurusan yang sudah terakreditasi. \n\nSMK PGRI Pekanbaru menyediakan berbagai fasilitas penunjang pendidikan bagi anak didiknya. Terdapat guru-guru dengan kualitas terbaik yang kompeten dibidangnya, kegiatan penunjang pembelajaran seperti ekstrakurikuler (ekskul), organisasi siswa, komunitas belajar, tim olahraga, dan perpustakaan sehingga siswa dapat belajar secara maksimal. Proses belajar dibuat senyaman mungkin bagi murid dan siswa",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 30,
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
                  "Visi",
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
            Text(
              "Menjadikan lembaga Diklat yang Menghasilkan Tenaga Kerja yang Professional Memiliki Kecerdasan Intelejius dan Emosional Spiritual Serta Mampu Bersaing Ditingkat Nasional dan Internasional yang Berwawasan Lingkungan.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 30,
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
                  "Misi",
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
            Text(
              "1. Sumber Daya Manusia Pengelola SMK\n2. Teknologi informatika dalam Pelaksanaan Pengajaran\n3. Sarana Pendidikan Sesuai dengan Perkembangan IPTEK\n4. Pemakaian Bahasa Inggris atau Bahasa Asing lainnya dilingkungan SMK\n5. Menyiapkan Siswa yang Profesional Dibidangnya dengan Menanamkan Semangat Kewirausahaan seerta\n6. Memiliki Keunggulan Profesi. Mutu, Serta Orientasi Masa Depan\n7. Manajemen Puncak Memastikan Ketersediaan, Kecukupan, dan Agar Persyaratan Siswa terpenuhi\n8. Melakukan peninjauan dan Perbaikan Sistem Manajemen Mutu atas Dasar Pengukuran/Penilaian Kepuasan\n9. Siswa untuk Memastikan Peningkatan Sistem Manajemen Mutu Secara Berkelanjutan\n10. Melakukan Kepedulian Lingkungan dengan Bank Sampah dan Penghijauan",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 30,
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
                  "Jurusan",
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
            Text(
              "1. Teknik Komputer Jaringan\n2. Rekayasa Perangkat Lunak\n3. Multimedia\n4. Akuntansi Keuangan Lembaga\n5. Usaha Perjalanan Wisata\n6. Otomatisasi Tata Kelola Perkantoran\n7. Bisnis Daring Pemasaran\n8. Perbankan Syariah",
              style: TextStyle(fontSize: 16),
            )
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
