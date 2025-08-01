import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/base.dart';
import 'package:todo/screens/login/login_connector.dart';

class LoginViewModel extends BaseViewModel<LoginConnector> {
  Future<void> login(String email, String password) async {
    try {
      connector!.showLoadingDialog();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      connector!.goToHome();
    } on FirebaseAuthException catch (e) {
      connector!.showErrorDialog(message: "Wrong mail or password");
    }
  }
}
