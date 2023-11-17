import 'package:buy_sellapp/UI/route/route.dart';
import 'package:buy_sellapp/UI/style/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController{

 final FirebaseAuth _auth = FirebaseAuth.instance;
 final box = GetStorage();
 /// <----------- SignUp ---------->
  signup(name,email,password,context)async{
    AppStyles().progressDialog(context);
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if(credential.user!.uid.isNotEmpty){
        CollectionReference collectionReference=FirebaseFirestore.instance.collection('users');
        collectionReference.doc(credential.user!.uid).set({
          'uid':credential.user!.uid,
          'email':email,
          'name':name
        });
        Map user={
          'uid':credential.user!.uid,
          'email':email,
          'name':name
        };
        box.write('user', user);
        Get.back();
        Get.offAndToNamed(bottomNavController);
        Get.showSnackbar(AppStyles().successSnacBar('Sign up successfully'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.back();
        Get.showSnackbar( AppStyles().failedSnacBar('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        Get.back();
        Get.showSnackbar(AppStyles().failedSnacBar('The account already exists for that email.'));

      }
    } catch (e) {
      Get.back();
      Get.showSnackbar(AppStyles().successSnacBar(e));
    }
  }

  /// <------------ Login ----------->
  login(email, password, context) async {
    AppStyles().progressDialog(context);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.uid.isNotEmpty) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .get()
            .then((DocumentSnapshot<Map<String, dynamic>> doc) {
          if (doc.exists) {
            var data = doc.data();
            print(data);
            Map user = {
              'uid': data!['uid'],
              'email': data['email'],
              'name': data['name']
            };
            box.write('user', user);
            print(user);
            Get.back();
            Get.offAndToNamed(bottomNavController);
            Get.showSnackbar(AppStyles().successSnacBar('Login successfull'));
          } else {
            Get.showSnackbar(AppStyles()
                .failedSnacBar('document does not exist on the database.'));
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.back();
        Get.showSnackbar(
            AppStyles().failedSnacBar('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        Get.back();
        Get.showSnackbar(AppStyles()
            .failedSnacBar('Wrong password provided for that user.'));
      }
    }
  }

  /// <------------ Forget Password ------------>
  forgetPassword(email,context)async{
    try{
      AppStyles().progressDialog(context);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.back();
      Get.showSnackbar(AppStyles().successSnacBar('email has been successfully'));
    }catch(e){
      Get.showSnackbar(AppStyles()
          .failedSnacBar('Something is wrong'));
      print(e);
    }
  }

  /// <-------- LogOut --------->
  logOut()async{
    _auth.signOut();
  }

}