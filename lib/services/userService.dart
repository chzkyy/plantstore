import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plantstore/model/userModel.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('user');

  Future<void> setUser(userModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<userModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return userModel(
        id: id,
        name: snapshot['name'],
        email: snapshot['email'],
      );
    } catch (e) {
      throw e;
    }
  }
}
