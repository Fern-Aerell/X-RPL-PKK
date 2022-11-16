import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:mypgri/system/data_informasi.dart';

class TabInformasiScreen extends StatelessWidget {

  int DataInformasiIndex;

  TabInformasiScreen({super.key, required this.DataInformasiIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informasi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ImageSlideshow(
              width: double.infinity,
              initialPage: 0,
              indicatorColor: Colors.red,
              indicatorBackgroundColor: Colors.grey,
              children: [
                for (int i = 0; i < DataInformasi[DataInformasiIndex]['foto'].length; i++) ...[
                  Image.asset(
                    DataInformasi[DataInformasiIndex]['foto'][i],
                    fit: BoxFit.cover,
                  ),
                ],
              ],
              autoPlayInterval: 3000,
              isLoop: true,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              DataInformasi[DataInformasiIndex]['judul'].toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              DataInformasi[DataInformasiIndex]['isi'].toString(),
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
