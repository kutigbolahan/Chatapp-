import 'package:chapappwithfirebase/chats/chat.dart';
import 'package:chapappwithfirebase/myhomepage.dart';
import 'package:chapappwithfirebase/register/login.dart';
import 'package:chapappwithfirebase/register/register.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      
      initialRoute: MyHomePage.routeName,
      routes: {
      MyHomePage.routeName: (context) => MyHomePage(),
      Register.routeName: (context) => Register(),
      Login.routeName: (context) => Login(),
      Chats.routeName: (context) => Chats(),
      },
    );
  }
}

