import 'package:chapappwithfirebase/authentication/auth.dart';
import 'package:chapappwithfirebase/chats/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  static const String routeName = 'Chats';
  final FirebaseUser user;

  const Chats({Key key, this.user}) : super(key: key);
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback()async {
  if (messageController.text.length > 0) {
    await _firestore.collection('messages').add({
      'text':messageController.text,
      'from':widget.user.email,
    });
    messageController.clear();
    scrollController.animateTo(scrollController.position.maxScrollExtent, 
    duration:const  Duration(milliseconds: 300), 
    curve: Curves.bounceIn);
    
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        leading: Hero(
          tag: 'logo',
          child: Container(
            height: 40,
            child: Image.asset(
              'assets/images/chat.png',
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.of(context).popUntil((route) => route.isFirst);
              })
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('messages').snapshots(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> docs=snapshot.data.documents;
                     List <Widget> messages = docs.map((doc)=> Message(
                       from: doc.data['from'],
                       text: doc.data['text'],
                       me: widget.user.email == doc.data['from']
                     )
                     
                     ).toList();
                      return ListView(
                        controller: scrollController,
                        children: <Widget>[
                         
                         ...messages,
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 6, left: 10),
                      child: TextField(
                        onSubmitted: (value)=> callback(),
                        decoration: InputDecoration(
                          
                          hintText: 'Type your message... ',
                          border: const OutlineInputBorder(),
                        ),
                        controller: messageController,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.teal,
                        ),
                        onPressed: callback),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
