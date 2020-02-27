import 'package:chapappwithfirebase/authentication/auth.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  static const String routeName= 'Chats';
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('logout'),
        leading: IconButton(icon:Icon(Icons.airline_seat_legroom_reduced) , onPressed: ()=>Auth.logout(context)),
      ),
      body:  Center(
        child: Text('data'),
      ),
    );
  }
}