import 'package:ewaste_susta/Colors/MyColors.dart';
import 'package:ewaste_susta/Pages/Inscription.dart';
import 'package:ewaste_susta/Pages/Tashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController mdp=TextEditingController();
  TextEditingController mdp1=TextEditingController();
  final login=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //Bottomsheet
    void _openBottomSheet() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          bool _isPasswordVisible = false; // État initial du mot de passe
          bool _isConfirmPasswordVisible = false; // État initial pour le champ de confirmation

          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  color: MyColors().verte,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create Your Account",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: MyColors().blanc,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: login,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(

                              hintText: 'Full Name',
                              hintStyle: TextStyle(color: MyColors().blanc),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(color: MyColors().blanc),
                            controller: name,
                            validator: ((value){
                              if (value == null || value.isEmpty) {
                                return 'Name cannot be empty.';
                              }
                            }),
                          ),
                          Divider(
                            color: MyColors().blanc,
                            thickness: 1.0,
                          ),
                          SizedBox(height: 10),

                          // Phone or Gmail
                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              hintText: 'Phone or Gmail',
                              hintStyle: TextStyle(color: MyColors().blanc),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(color: MyColors().blanc),
                            validator: ((value){
                              if (value == null || value.isEmpty) {
                                return 'Email or phone  cannot be empty.';
                              }
                            }),
                          ),
                          Divider(
                            color: MyColors().blanc,
                            thickness: 1.0,
                          ),
                          SizedBox(height: 10),

                          // Password
                          TextFormField(
                            controller: mdp,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: MyColors().blanc),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: _isPasswordVisible
                                      ? Colors.yellow
                                      : MyColors().blanc,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),

                            ),
                            validator: ((value){
                              if (value == null || value.isEmpty) {
                                return 'Password cannot be empty.';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters long.';
                              }

                              // Check for at least 2 digits
                              int digitCount = 0;
                              for (int i = 0; i < value.length; i++) {
                                if (RegExp(r'\d').hasMatch(value[i])) {
                                  digitCount++;
                                }
                              }
                              if (digitCount < 2) {
                                return 'Password must contain at least 2 digits.';
                              }

                              // Check if it contains at least one letter or symbol
                              if (RegExp(r'^\d+$').hasMatch(value)) {
                                return 'Password must contain letters or symbols.';
                              }

                              return null;
                            }),

                            style: TextStyle(color: MyColors().blanc),
                            obscureText: !_isPasswordVisible,
                          ),
                          Divider(
                            color: MyColors().blanc,
                            thickness: 1.0,
                          ),
                          SizedBox(height: 10),

                          // Confirm Password
                          TextFormField(
                            controller: mdp,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(color: MyColors().blanc),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isConfirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: _isConfirmPasswordVisible
                                      ? Colors.yellow
                                      : MyColors().blanc,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isConfirmPasswordVisible =
                                    !_isConfirmPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            style: TextStyle(color: MyColors().blanc),
                            obscureText: !_isConfirmPasswordVisible,
                            validator: ((value){
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password.';
                              }

                              // Check if the confirmation password matches the first one
                              if (value != mdp1.text) {
                                return 'Passwords do not match.';
                              }

                              return null;
                            }),
                          ),
                          Divider(
                            color: MyColors().blanc,
                            thickness: 1.0,
                          ),
                          SizedBox(height: 20),

                          // Sign Up Button
                          GestureDetector(
                            onTap:  () async {
                              if (login.currentState!.validate()) {
                                await EasyLoading.show(status: 'Chargement...');
                                await Future.delayed(Duration(seconds: 2));
                                await EasyLoading.dismiss();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Inscription()));
                              }

                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 50,
                              decoration: BoxDecoration(
                                color: MyColors().blanc,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: MyColors().noir,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    // Full Name

                  ],
                ),
              );
            },
          );
        },
      );
    }



    return Scaffold(
      backgroundColor: MyColors().blanc,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset('assets/icon.jpeg')],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:  () async {
                    await EasyLoading.show(status: 'Chargement...');
                    await Future.delayed(Duration(seconds: 2));
                    await EasyLoading.dismiss();

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Inscription()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                    padding: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: MyColors().verte,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign-in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors().blanc,
                              fontSize: 24),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
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
                  onTap: _openBottomSheet,
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: MyColors().blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign-up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors().blanc,
                              fontSize: 24),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
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
    );
  }
}
