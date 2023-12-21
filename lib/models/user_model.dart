import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String email;
  String profiePhoto;
  String uid;

  User(
      {required this.name,
      required this.profiePhoto,
      required this.email,
      required this.uid});

  Map<String, dynamic> toJson() =>
      {"name": name, "email": email, "profilePhoto": profiePhoto, "uid": uid};

  static User fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        name: snapshot['name'],
        profiePhoto: snapshot['profiePhoto'],
        email: snapshot['email'],
        uid: snapshot['uid']);
  }
}
