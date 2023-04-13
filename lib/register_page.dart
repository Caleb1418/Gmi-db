

// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';


class RegisterPage extends StatefulWidget{

@override
State <RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  final _firstNameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();


 @override 
 void dispose(){
  _firstNameController.dispose();
  _addressController.dispose();
  _birthdateController.dispose();
  _lastNameController.dispose();
  super.dispose();
 }
Future signUp() async{
  registerUserDetails(
      _firstNameController.text.trim(),
    _lastNameController.text.trim(),
     _birthdateController.text.trim(),
      _addressController.text.trim(),
  );
    showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Signed up"),
        content: Text("Your registration was successful!"),
        actions: <Widget>[
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              // Clear form fields
              _firstNameController.clear();
              _lastNameController.clear();
              _birthdateController.clear();
              _addressController.clear();

              // Dismiss dialog
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );

}
 Future registerUserDetails(String  firstName , String lastName,String  birthDay , String address) async{
  await FirebaseFirestore.instance.collection("Users").add({
    'first name': firstName ,
    'last name': lastName ,
    'birth  day': birthDay ,
  'address':address,
   });
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(
                  Icons.app_registration_sharp,
                  size: 100,
                ),
                SizedBox(height: 75,),
                Text('Hi There',
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Register below with you details!",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Name",
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
                ),
                 SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Surname",
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
                ),
                 SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: TextField(
                  controller: _birthdateController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Birthday",
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
                ),
                 SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Address",
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
                ),
                SizedBox(height: 10,),

                Padding(padding:const EdgeInsets.symmetric(horizontal:25.0),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color:  Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child:   Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                    ),
                    
                  ),
                ), )
              ],
            ),
          ),
        ),
      ),
    );
  }

 
}