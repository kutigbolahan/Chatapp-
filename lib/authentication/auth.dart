import 'package:chapappwithfirebase/chats/chat.dart';
import 'package:chapappwithfirebase/myhomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
 static final  _auth = FirebaseAuth.instance;
 final GoogleSignIn _googleSignIn = GoogleSignIn();

 Future<String> signInWithGoogle()async{
   try {
     final GoogleSignInAccount  _googleSignInAccount= await _googleSignIn.signIn();
     final GoogleSignInAuthentication _googleSignInAuthentication =
     await _googleSignInAccount.authentication;

     final AuthCredential  _credential = GoogleAuthProvider.getCredential(
       idToken: _googleSignInAuthentication.idToken,
        accessToken: _googleSignInAuthentication.accessToken
        );

        final AuthResult _authResult = await _auth.signInWithCredential(_credential);
        final FirebaseUser _user = _authResult.user;

        assert(!_user.isAnonymous);
        assert(await _user.getIdToken() != null);

        final FirebaseUser _currentUser = await _auth.currentUser();
        assert(_user.uid == _currentUser.uid);

        return 'SignInWithGoogle Succeeded: $_user';

     
   } catch (e) {
     print(e);
   }
 }

 void signOutGoogle(){

 }

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
