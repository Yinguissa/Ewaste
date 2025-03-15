import 'package:ewaste_susta/Colors/MyColors.dart';
import 'package:ewaste_susta/Pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Tashboard.dart';

class Low extends StatefulWidget {
  const Low({super.key});

  @override
  State<Low> createState() => _LowState();
}

class _LowState extends State<Low> {
  // Données des cours gratuits avec photos en ligne
  final List<Map<String, String>> courses = [
    {
      "title": "Fix RAM Issues",
      "duration": "15 min",
      "lessons": "12 lessons",
      "thumbnail":
      "assets/ram.PNG", // Image générique
      "videoUrl": "https://youtube.com/shorts/weOhxGwRhJo?si=3LvSpVl-wbq1Qboh",
    },
    {
      "title": "Replace Laptop Battery",
      "duration": "5 min",
      "lessons": "10 lessons",
      "thumbnail":
      "assets/battery.PNG", // Image générique
      "videoUrl": "https://youtu.be/jHHEyuSJoIA?si=Lu4NSZpKMh4VWfTp",
    },
    {
      "title": "Change Laptop Screen",
      "duration": " 32 min",
      "lessons": "2 lessons",
      "thumbnail":      "assets/laptopscreen.PNG", // Image générique
      "videoUrl": "https://youtu.be/Wl8MHnDx-rA?si=nWrVpMv3jeThoOvh",
    },
    {
      "title": "Changing System",
      "duration": "30 min",
      "lessons": "1 lesson",
      "thumbnail":     "assets/network.PNG", // Image générique
      "videoUrl": "https://youtu.be/s7qS99B-LLY?si=p-TIHoufv8vE6W6V",
    }
  ];

  // Fonction pour ouvrir les vidéos YouTube
  void _launchVideo(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw "Impossible d'ouvrir $url";
    }
  }

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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Tashboard()));
              },
              child: Icon(
                Icons.arrow_circle_left_outlined,
                color: MyColors().blanc,
                size: 45,
              ),
            ),
            Text(
              "Learn Low Skills",
              style: TextStyle(
                  fontSize: 20,
                  color: MyColors().blanc,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.settings,
              color: MyColors().blanc,
              size: 45,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barre de recherche
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Repair Your own Computer...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Catégories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _categoryChip("All courses"),
                  _categoryChip("Materiel"),
                  _categoryChip("Logiciel"),
                  _categoryChip("Fixing"),
                ],
              ),
              SizedBox(height: 20),
              // Liste des cours gratuits
              Text(" Well-known courses",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return GestureDetector(
                    onTap: () => _launchVideo(course['videoUrl']!),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          // Image du cours
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12)),
                            child: Image.asset(
                              course['thumbnail']!,
                              width: 120,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Détails du cours
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(course['title']!,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text(
                                      "${course['duration']} • ${course['lessons']}"),
                                  SizedBox(height: 5),
                                  Text("Free",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: MyColors().verte,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
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

  Widget _categoryChip(String label) {
    return Chip(
      backgroundColor: MyColors().verte.withOpacity(0.1),
      label: Text(label,
          style: TextStyle(
            color: MyColors().verte,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
