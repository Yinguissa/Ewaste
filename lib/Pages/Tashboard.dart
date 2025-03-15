import 'package:ewaste_susta/Colors/MyColors.dart';
import 'package:ewaste_susta/Pages/BuyItem.dart';
import 'package:ewaste_susta/Pages/Inscription.dart';
import 'package:ewaste_susta/Pages/LowSkill.dart';
import 'package:ewaste_susta/Pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

import 'high.dart';

class Tashboard extends StatefulWidget {
  const Tashboard({super.key});

  @override
  State<Tashboard> createState() => _TashboardState();
}
class _TashboardState extends State<Tashboard> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _launchURL() async {
    const url = 'https://my.jobstreet.com/';  // Remplacez avec l'URL que vous souhaitez ouvrir
    if (await canLaunch(url)) {
      await launch(url);  // Ouvre l'URL dans un navigateur
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchURL1() async {
    const url = 'https://unccelearn.org/course/view.php?id=143&page=overview&lang=en';  // Remplacez avec l'URL que vous souhaitez ouvrir
    if (await canLaunch(url)) {
      await launch(url);  // Ouvre l'URL dans un navigateur
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: MyColors().cendre,
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              padding: EdgeInsets.only(top: 30, right: 15, left: 15),
              width: MediaQuery.of(context).size.width,
              color: MyColors().verte,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          color: MyColors().blanc,
                          size: 45,
                        ),
                      ),
                      Icon(
                        Icons.notification_add,
                        color: Colors.white,
                        size: 40,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "A.SALAM ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "Welcom to E-Waste app ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 53,
                      ),
                      Text(
                        "Let's upgrade your skill",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: MyColors().blanc,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search course",
                          hintStyle:
                              TextStyle(fontSize: 14, color: MyColors().noir),
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 10),
                    margin: EdgeInsets.only(
                        top: 20, left: 10, right: 5, bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.98,
                    decoration: BoxDecoration(
                        color: MyColors().blanc,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Learned today",
                              style: TextStyle(
                                  color: MyColors().verte,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "46min/",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: MyColors().noir,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "60min",
                              style: TextStyle(
                                  color: MyColors().cendre,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        LinearProgressIndicator(
                          minHeight: 15,
                          backgroundColor: Colors.deepOrange,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // ListView horizontal avec 3 containers
            Container(
              padding: EdgeInsets.only(top: 20),
              child:
              SizedBox(
                height: 100, // hauteur de chaque container
                child: ListView(
                  scrollDirection: Axis.horizontal, // Direction horizontale
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      width: 260,
                      // Largeur de chaque container
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: MyColors().blue, // couleur de fond
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "What do you want to learn today?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => _launchURL1(),
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: MyColors().verte,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  child: Center(
                                    child: Text(
                                      "Get Started",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: MyColors().blanc),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 260,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: MyColors().vert, // Couleur principale
                        borderRadius: BorderRadius.circular(12), // Coins arrondis
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4), // Ombre douce
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Position de l'ombre
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('assets/recycle_pattern.PNG'), // Arrière-plan léger
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            MyColors().vert.withOpacity(0.2), // Transparence sur l'image
                            BlendMode.dstATop,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Icône d'accompagnement
                          Icon(
                            Icons.recycling, // Icône de recyclage
                            size: 50,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          // Texte stylisé
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'eWaste Solutions',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Recyclage et réparation \nd’appareils électroniques',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: 260,
                      height: 150, // Hauteur ajustée pour le contenu
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.transparent, // Aucune couleur pour laisser le GIF visible
                        borderRadius: BorderRadius.circular(12), // Coins arrondis
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Ombre douce
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3), // Position de l'ombre
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('assets/recycle.gif'), // GIF comme fond
                          fit: BoxFit.cover, // Ajustement complet du GIF
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Icône d'accompagnement avec effet ombré pour plus de visibilité
                          SizedBox(width: 10),
                          // Texte stylisé avec effet d'ombre pour contraster avec le GIF

                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "  Categories",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 12),
                ),
                Text(
                  "View all  ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 12),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    await EasyLoading.show(status: 'Processing...');
                    await Future.delayed(Duration(seconds: 2));
                    await EasyLoading.dismiss();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => High()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    width: 140,
                    decoration: BoxDecoration(
                        color: MyColors().blanc,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColors().verte, width: 2)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Image.asset('assets/high.png')],
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>High()));
                          },
                          child: Text(
                            "High Skill",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors().verte),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await EasyLoading.show(status: 'Processing...');
                    await Future.delayed(Duration(seconds: 2));
                    await EasyLoading.dismiss();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Low()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    width: 140,
                    height: 130,
                    decoration: BoxDecoration(
                        color: MyColors().blanc,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColors().verte, width: 2)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Image.asset('assets/lows.jpg')],
                        ),
                        Text(
                          "Low Skill",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors().verte),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    await EasyLoading.show(status: 'charging...');
                    await Future.delayed(Duration(seconds: 3));
                    await EasyLoading.dismiss();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Buyitem()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    padding: EdgeInsets.only(bottom: 15),
                    width: 140,
                    decoration: BoxDecoration(
                        color: MyColors().blanc,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColors().verte, width: 2)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/buy.png',
                              width: 80,
                            )
                          ],
                        ),
                        Text(
                          "Buy Items",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors().verte),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _launchURL(),
                  child: Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    width: 140,
                    decoration: BoxDecoration(
                        color: MyColors().blanc,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColors().verte, width: 2)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Image.asset('assets/job.png')],
                        ),
                        Text(
                          "Find Jobs",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors().verte),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: MyColors().blanc,
        child: DrawerHeader(
            child: Container(
              width: 120,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "E-Waste App",
                        style: TextStyle(
                            color: MyColors().blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Image.asset(
                        'assets/icon.jpeg',
                        width: 45, // 50% de la largeur de l'écran
                      ),
                    ],
                  ),
                  Divider(
                    color: MyColors().blue,
                    thickness: 1.4,
                    indent: 0,
                    endIndent: 0,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Inscription()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Profil",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: MyColors().vert),
                        ),
                        Icon(
                          Icons.person,
                          color: MyColors().vert,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "About us",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: MyColors().vert),
                      ),
                      Icon(
                      Icons.add_alert,
                        color: MyColors().vert,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                      onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Settings()));
            },
                        child: Text(
                          "Settings",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: MyColors().vert),
                        ),
                      ),
                      Icon(
                        Icons.settings,
                        color: MyColors().vert,
                        size: 30,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Help",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: MyColors().vert),
                      ),
                      Icon(
                        Icons.help,
                        color: MyColors().vert,
                      ),
                    ],
                  ),
                  Spacer(),
                  Divider(
                    color: MyColors().RougeBordeau,
                    thickness: 1.5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await EasyLoading.show(status: 'Déconnexion en cours...');
                      await Future.delayed(Duration(seconds: 3));
                      await EasyLoading.dismiss();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Inscription()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Deconnexion",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: MyColors().rouge),
                        ),
                        Icon(
                          Icons.logout,
                          color: MyColors().RougeBordeau,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 10),
        width: 60,
        height: 40,
        color: MyColors().verte,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Tashboard()));
              },
              child: Icon(
                Icons.home,
                color: MyColors().blanc,
                size: 35,
              ),
            ),
            Icon(
              Icons.person,
              color: MyColors().blanc,
              size: 35,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Settings()));
              },
              child: Icon(
                Icons.settings,
                color: MyColors().blanc,
                size: 35,
              ),
            ),
            Icon(
              Icons.help,
              color: MyColors().blanc,
              size: 35,
            )
          ],
        ),
      ),
    );
  }
}
