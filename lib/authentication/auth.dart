import 'package:chapappwithfirebase/chats/chat.dart';
import 'package:chapappwithfirebase/myhomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Auth {
  static final _auth = FirebaseAuth.instance;
  

  static void registerUser(
      BuildContext context, String email, String password) async {
    AuthResult user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Chats(user: user.user)));
  }

  static void login(BuildContext context, String email, String password) async {
    AuthResult user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Chats(user: user.user)));
  }

  static void logout(context) {
    _auth.signOut();
    Navigator.pushReplacementNamed(context, MyHomePage.routeName);
  }
}

final _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'SignInWithGoogle Succeeded: $user';
}

void signOutGoogle() async {
  await _googleSignIn.signOut();
  print('User Sign Out');
}
