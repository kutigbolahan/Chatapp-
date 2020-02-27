import 'package:chapappwithfirebase/authentication/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static const String routeName = 'Register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Auth.registerUser(context, email, password);
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
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _submit,
                  // Navigator.of(context).pushNamed(Register.routeName);

                  minWidth: 200.0,
                  height: 45.0,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
