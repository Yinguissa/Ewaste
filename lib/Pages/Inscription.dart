import 'package:ewaste_susta/Colors/MyColors.dart';
import 'package:ewaste_susta/Pages/Tashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  String? phoneNumber; // Variable pour le numéro de téléphone
  String? password; // Variable pour le mot de passe
  TextEditingController email=TextEditingController();
  TextEditingController mdp=TextEditingController();
  final login=GlobalKey<FormState>();

  // Ouvre le bottom sheet
  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Reset your password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text("Enter your email to reset your password."),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action de réinitialisation du mot de passe
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().blanc,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image centrée
                Image.asset(
                  'assets/login.gif', // Remplacez ceci par votre chemin d'image
                  height: 250,
                  width: 250,
                ),
                SizedBox(height: 20),

                // Champ de numéro de téléphone
                Form(
                  key:login ,
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 9,
                        controller: email,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                        validator: ((value){
                          if (value == null || value.isEmpty) {
                            return 'Phone number cannot be empty.';
                          }

                          // Check if the phone number contains only numbers
                          if (!RegExp(r'^\d+$').hasMatch(value)) {
                            return 'Phone number must contain only numbers.';
                          }

                          // Check if the phone number has the correct length (e.g., 10 digits)
                          if (value.length != 9) {
                            return 'Phone number must be 9 digits long.';
                          }

                          return null;
                        }),
                      ),
                      SizedBox(height: 20),

                      // Champ de mot de passe
                      TextFormField(
                        controller: mdp,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.visibility),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                        validator: ((value){
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty.';
                          }

                          // Vérifier la longueur minimale
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long.';
                          }

                          // Vérifier si le mot de passe contient au moins 2 chiffres
                          int digitCount = 0;
                          for (int i = 0; i < value.length; i++) {
                            if (RegExp(r'\d').hasMatch(value[i])) {
                              digitCount++;
                            }
                          }
                          if (digitCount < 2) {
                            return 'Password must contain at least 2 digits.';
                          }

                          // Vérifier s'il y a au moins un caractère non numérique
                          if (RegExp(r'^\d+$').hasMatch(value)) {
                            return 'Password must contain letters or symbols.';
                          }

                          return null;
                        }),
                      ),
                      SizedBox(height: 20),

                      // Bouton de connexion
                      GestureDetector(
                        onTap:  () async {
                          if (login.currentState!.validate()) {
                            await EasyLoading.show(status: 'Chargement...');
                            await Future.delayed(Duration(seconds: 2));
                            await EasyLoading.dismiss();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Tashboard()));
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: MyColors().verte),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: MyColors().blanc),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
             

                SizedBox(height: 20),

                // Bouton "Forgot Password"
                TextButton(
                  onPressed: _openBottomSheet,
                  child: Text('Forgot Password?'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 10),
        width: 60,
        height: 40,
        color: MyColors().verte,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Copyright c 2024 | Made with by E-Waste",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: MyColors().blanc),
                ),

              ],
            ),
            Divider(
              color: MyColors().blanc,
              thickness: 2,
            ),

          ],
        ),
      ),
    );
  }
}
