import 'package:chapappwithfirebase/authentication/auth.dart';
import 'package:chapappwithfirebase/chats/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  static const String routeName= 'Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey= GlobalKey<FormState>();
  String email;
  String password;
  _loginvalidate(){
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Auth.login(context, email, password);
      
    }
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Form(
        key: _formKey,
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset(
                      'assets/images/chat.png',
                      width: 170,
                      height: 170,
                    ),
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Your Email..',
                  border: const OutlineInputBorder(),
                ),
                validator: (input) => !input.contains('@')
                ? 'Please enter a valid email'
                :null,
                onSaved: (input) => email = input,
              ),
            ),
            SizedBox(
              height: 20,
            ),
             Padding(
               padding: const EdgeInsets.all(16.0),
               child: TextFormField(
                 
                 autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  
                  hintText: 'Enter Your password..',
                  border: const OutlineInputBorder(),
                ),
                validator: (input) => input.length < 6
                ? 'Must beat least 6 characters'
                :null,
                onSaved: (input) => password = input,
                obscureText: true,
            ),
             ),
            // SizedBox(
            //   height: 20,
            // ),
            Container(
              child: Material(
                color: Colors.teal[400],
                elevation: 6,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _loginvalidate,
                  // Navigator.of(context).pushNamed(Register.routeName);

                  minWidth: 200.0,
                  height: 45.0,
                ),
              ),
            ),
            SignInButton(
              Buttons.Google,
              onPressed: (){
                signInWithGoogle().whenComplete(() => 
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return Chats();
                })));
                }
              
             
            ),
            SizedBox(
              height: 20,
            ),
            SignInButton(
              Buttons.Facebook, 
              onPressed: (){}),
        SizedBox(
              height: 20,
            ),
            SignInButton(Buttons.Email, onPressed: (){}),
            SizedBox(
              height: 20,
            ),
            SignInButton(Buttons.Twitter, onPressed: (){}),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}