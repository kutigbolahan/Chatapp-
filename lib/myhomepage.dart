import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                  tag: 'logo',
                  child: Container(
                    width: 100,
                    child: Image.asset(
                      'assets/images/chat.png',
                      width: 70,
                      height: 70,
                    ),
                  )),
              Text(
                'Chat App',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
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
                onPressed: () {},
                minWidth: 200.0,
                height: 45.0,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
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
                onPressed: () {},
                minWidth: 200.0,
                height: 45.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          child: Text(text),
          onPressed: callback,
          // minWidth: 100.0,
          //height: 45.0,
        ),
      ),
    );
  }
}