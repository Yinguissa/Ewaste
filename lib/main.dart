import 'package:ewaste_susta/Pages/BuyItem.dart';
import 'package:ewaste_susta/Pages/Collection.dart';
import 'package:ewaste_susta/Pages/FirstPage.dart';
import 'package:ewaste_susta/Pages/Inscription.dart';
import 'package:ewaste_susta/Pages/Myvideo.dart';
import 'package:ewaste_susta/Pages/Tashboard.dart';
import 'package:ewaste_susta/Pages/high.dart';
import 'package:ewaste_susta/Pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home:  Firstpage(),
    );
  }
}

