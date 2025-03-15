import 'package:ewaste_susta/Colors/MyColors.dart';
import 'package:ewaste_susta/Pages/settings.dart';
import 'package:flutter/material.dart';

import 'Tashboard.dart';

class Buyitem extends StatefulWidget {
  const Buyitem({super.key});

  @override
  State<Buyitem> createState() => _BuyitemState();
}

class _BuyitemState extends State<Buyitem> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _autoScroll();
  }

  void _autoScroll() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (_controller.hasClients) {
        if (_controller.page != null) {
          _controller.animateToPage(
            (_controller.page!.toInt() + 2) % 6,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().blanc,
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
              "Buy Your Items",
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Popular Electronics Buy Very Cheap",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _controller,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _buildHorizontalItem(index);
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "New Arrivals",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return _buildVerticalItem(index);
              },
            ),
          ],
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

  // Widget pour chaque item horizontal avec des images en ligne
  Widget _buildHorizontalItem(int index) {
    final items = [
      {
        'name': 'Phone Battery',
        'image': 'assets/battery.PNG',
        'price': '20.00',
      },
      {
        'name': 'Laptop Battery',
        'image': 'assets/pc.PNG',
        'price': '50.00',
      },
      {
        'name': 'Laptop Screen',
        'image': 'assets/laptopscreen.PNG',
        'price': '100.00',
      },
      {
        'name': 'Phone Screen',
        'image': 'assets/screen.PNG',
        'price': '80.00',
      },
      {
        'name': 'Ram',
        'image': 'assets/ram.PNG',
        'price': '5.00',
      },
      {
        'name': 'E-Waste Recycle',
        'image': 'assets/charger.png',
        'price': '30.00',
      },
    ];

    return GestureDetector(
      onTap: () {
        _showItemDetailsModal(
          imageUrl: items[index]['image']!,
          itemName: items[index]['name']!,
          price: items[index]['price']!,
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(items[index]['image']!),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            items[index]['name']!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black54,
                  offset: Offset(1, 1),
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget pour chaque item vertical (nouveaux produits)
  Widget _buildVerticalItem(int index) {
    final items = [
      {
        'name': 'Phone Battery',
        'image': 'assets/battery.PNG',
        'price': '20.00',
      },
      {
        'name': 'Laptop Battery',
        'image': 'assets/pc.PNG',
        'price': '50.00',
      },
      {
        'name': 'Laptop Screen',
        'image': 'assets/laptopscreen.PNG',
        'price': '100.00',
      },
      {
        'name': 'Phone Screen',
        'image': 'assets/screen.PNG',
        'price': '80.00',
      },
      {
        'name': 'Ram',
        'image': 'assets/ram.PNG',
        'price': '5.00',
      },
      {
        'name': 'Charger',
        'image': 'assets/charger.png',
        'price': '30.00',
      },
    ];

    return GestureDetector(
      onTap: () {
        _showItemDetailsModal(
          imageUrl: items[index]['image']!,
          itemName: items[index]['name']!,
          price: items[index]['price']!,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Image.asset(
              items[index]['image']!,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[index]['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${items[index]['price']}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green.shade700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Modal pour afficher les détails de l'item
  void _showItemDetailsModal({required String imageUrl, required String itemName, required String price}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover),
              const SizedBox(height: 16),
              Text(
                itemName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '\RM $price',
                style: TextStyle(fontSize: 18, color: Colors.green.shade700),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);  // Close the details modal
                  _showItemAddedModal(itemName);  // Show item added to cart modal
                },
                child: const Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
              ),
            ],
          ),
        );
      },

    );
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
    );
  }

  // Modal pour confirmer que l'item a été ajouté au panier
  void _showItemAddedModal(String itemName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Item Added"),
          content: Text("$itemName has been added to your cart!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);  // Close the confirmation modal
              },
              child: const Text("OK"),
            ),
          ],
        );

      },

    );
  }
}
