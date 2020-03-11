import 'package:chapappwithfirebase/chats/chat.dart';
import 'package:chapappwithfirebase/myhomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
 static final  _auth = FirebaseAuth.instance;

  static void registerUser(
      BuildContext context, String email, String password) async {
    AuthResult user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    
    Navigator.push(context, MaterialPageRoute(builder: (context) => Chats(user:user.user)));
  }

  static void login(
      BuildContext context, String email, String password) async {
    AuthResult user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
   
    Navigator.push(context, MaterialPageRoute(builder: (context) => Chats(user:user.user)));
  }

  static void logout(context){
    _auth.signOut();
   Navigator.pushReplacementNamed(context, MyHomePage.routeName);
  }
}
