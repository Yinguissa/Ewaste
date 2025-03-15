import 'package:ewaste_susta/Colors/MyColors.dart';
import 'package:ewaste_susta/Pages/Tashboard.dart';
import 'package:ewaste_susta/Pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import du package url_launcher

class High extends StatefulWidget {
  const High({super.key});

  @override
  State<High> createState() => _HighState();
}

class _HighState extends State<High> {
  // Liste des noms, liens et progressions
  final List<Map<String, dynamic>> items = [
    {
      "name": "Problem charger",
      "image": "assets/charger.png",
      "progress": 0.8,
      "url": "https://www.youtube.com/shorts/hiqCDXJv3ls?feature=share",
    },
    {
      "name": "Changing Screen",
      "image": "assets/screen.PNG",
      "progress": 0.6,
     "url":"https://www.youtube.com/shorts/K4HY57-E8yI",
    },
    {
      "name": "Changing Battery",
      "image": "assets/battery.PNG",
      "progress": 0.4,
      "url":"https://www.youtube.com/shorts/OCYZ1H_X6MI",
    },
    {
      "name": "Moter problem",
      "image": "assets/profile4.jpg",
      "progress": 0.9,
      "url":"https://youtu.be/7PbexgCYlDo",
    },
    {
      "name": "Camera problem",
      "image": "assets/camera.PNG",
      "progress": 0.5,
      "url":"https://www.youtube.com/shorts/vAx3wZrjuAc",
    },
    {
      "name": "Sim",
      "image": "assets/sim.PNG",
      "progress": 0.7,
      "url":"https://www.youtube.com/watch?v=qBm69-sgORc&t=116s&pp=ygUSc2lubSBwaG9uZSBwcm9ibGVt",
    },
    {
      "name": "Network problem",
      "image": "assets/network.PNG",
      "progress": 0.3,
      "url":"https://www.youtube.com/watch?v=g6IGwzEo_Pg&pp=ygUNcGhvbmUgcHJvYmxlbQ%3D%3D",

    },
    {
      "name": "Screen Lines Problem",
      "image": "assets/line.PNG",
      "progress": 0.2,
      "url":"https://youtu.be/Pkjij6LnLTw?si=cdftqrOIZASeXYVM",

    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors().verte,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Tashboard()));
              },
              child: Icon(
                Icons.arrow_circle_left_outlined,
                color: MyColors().blanc,
                size: 45,
              ),
            ),
            Text(
              "High Skills",
              style: TextStyle(
                  fontSize: 16,
                  color: MyColors().blanc,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.video_call,
              color: MyColors().blanc,
              size: 45,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () async {
              // Si un "url" existe, essaye d'ouvrir ce lien
              if (item["url"] != null) {
                final url = item["url"];
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              } else {
                // Sinon, exécute l'action définie dans onTap
                item["onTap"]?.call();
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(item["image"]),
                    radius: 25,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item["name"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Progress:'),
                      SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: item["progress"],
                        color: MyColors().verte,
                        backgroundColor: Colors.grey.shade300,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
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
