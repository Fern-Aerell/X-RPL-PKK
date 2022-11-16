import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:mypgri/screen/home_screen.dart';
import 'package:mypgri/screen/pegawai_screen.dart';
import 'package:mypgri/screen/profil_screen.dart';
import 'package:mypgri/screen/tab_informasi_screen.dart';
import 'package:mypgri/system/data_informasi.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'screen/guru_screen.dart';
import 'screen/rpl_screen.dart';

void main() {
  runApp(MyPGRI());
}

class MyPGRI extends StatelessWidget {
  const MyPGRI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: generateMaterialColor(color: HexColor("cd282c"))),
      home: HomeScreen(),
      routes: {
        "/home":(context) => HomeScreen(),
        "/profil":(context) => ProfilScreen(),
        "/guru":(context) => GuruScreen(),
        "/pegawai":(context) => PegawaiScreen(),
        "/xrpl":(context) => RplScreen(),
      }
    );
  }
}
