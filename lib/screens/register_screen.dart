import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ironaeacus/screens/main_screen.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RegisterScreen extends StatefulWidget {
  static String id = 'register_screen';


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late String firstname;
  late String lastname;
  late String email;
  late String gender;
  //late DateTime birthday;
  late String height;
  late String  weight;
  late String password;

  DateTime _selectedDate = DateTime(2022, 12, 24);
  String startingText = 'Enter Your Birthday!' ;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null){
        return;
      }
      setState (() {
        _selectedDate = pickedDate;
        startingText = DateFormat.yMd().format(_selectedDate);
      });

    });
    //birthday = _selectedDate;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(
                    Icons.sports_gymnastics,
                    size: 50
                ),
                SizedBox(height: 10),
                Text("Iron Aeacus!",
                    style: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.bold)),
                Text("A free beginner workout application!",
                    style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value){
                          firstname = value;

                        },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'First Name',
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(15)
                      ),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: MaterialButton(height: 10, minWidth: 500, onPressed: _presentDatePicker, child: Text(startingText)),
                      ),
                      ),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value){
                            lastname = value;

                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Last Name'
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value){
                            gender= value;

                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Gender'
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value){
                            height = value;

                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Height'
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value){
                            weight = value;

                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Weight'
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          onChanged: (value){
                            email = value;

                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email'
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value){
                            password = value;

                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password'
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(15)
                    ) ,
                    child: Center(
                        child: MaterialButton(
                            onPressed: () async {
                              try{
                                final newUser =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
                                if (newUser != null) {
                                  _firestore.collection('profile').add({
                                    //'birthday': birthday,
                                    'email': email,
                                    'firstname':firstname,
                                    'gender':gender,
                                    'height':height,
                                    'lastname': lastname,
                                    'weight':weight
                                  });
                              Navigator.pushNamed(context, MainScreen.id);

                              }
                              }
                              catch (e){
                                print (e);
                              }

                              
                            },
                            child:Text('Register',
                                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))

                        )
                    ),
                  ),
                ),
              ],),
          ),
        ),
      ),
    );
  }
}
