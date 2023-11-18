import 'package:buy_sellapp/Model/products.dart';
import 'package:buy_sellapp/Model/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FireStoreDB {
  List<Product> product=[];
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserProfile> getUserProfile() async {
    final snapshot = await _firebaseFirestore
        .collection('users')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    final userData =
        snapshot.docs.map((e) => UserProfile.fromSnapshot(e)).single;
    return userData;
  }

  Future<void> userProfileUpdate(UserProfile user)async{

    await _firebaseFirestore.collection('users').doc(user.uid).update(user.toJson()).then((value) => Get.snackbar('Success','Update Success'));
  }

  ///<-------homescreen getProducts -------------->
  Future<List<Product>> getProducts() async {
    final snapshot = await _firebaseFirestore.collection('products').get();
    final productData =
    snapshot.docs.map((e) => Product.fromSnapshot(e)).toList();
    return productData;
  }
}
