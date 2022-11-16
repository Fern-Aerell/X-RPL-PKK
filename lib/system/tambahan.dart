import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

bool welcome = true;

Future<void> launchURL(String url, String path) async {
    final Uri uri = Uri(scheme: "https", host: url, path: path);
    print(uri);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Tidak dapat memuat link $url";
    }
  }

notifDoang(BuildContext context, String pesan, int duration) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(pesan),
    duration: Duration(milliseconds: duration),
  ));
}
