import 'package:demo_project1/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {


  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar:AppBar(
        title: Text('ORDER NOW'),
        backgroundColor: Colors.brown[400],
        elevation:0.0,
        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.person),
            label:Text('logout'),
            onPressed: ()async{
              await _auth.signOut();
            },
          )
        ]
      )
    );
  }
}
