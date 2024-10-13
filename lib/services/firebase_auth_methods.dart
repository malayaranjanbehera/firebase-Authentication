import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mecreate_firebase/services/showSnackbar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //Email signIn
  Future<void>SignUpWithEmail ({
    required String email,
    required String password,
    required BuildContext context,
  })
  async{
    try{
      await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password);
        await sendEmailVerification(context);
    }on FirebaseAuthException catch(e){
      showSnackBar(context,e.message!);

    }
  }

  Future <void> sendEmailVerification(BuildContext context) async{
    try{
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context,'email.sent');

    }on FirebaseAuthException catch(e){
      showSnackBar(context,e.message!);
    }
  }


}