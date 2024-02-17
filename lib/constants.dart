import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:freels/controllers/auth_controller.dart';
import 'package:freels/views/screens/addvideo_screen.dart';

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var fireStore = FirebaseFirestore.instance;

var authController = AuthController.instance;
List<String> screenTitles = ['Home', 'Search', 'Add', 'Messages', 'Profile'];
List<Widget> screens = [
  Text('HomeScreen'),
  Text('SearchScreen'),
  AddvideoScreen(),
  Text('MessagesScreen'),
  Text('ProfileScreen')
];
