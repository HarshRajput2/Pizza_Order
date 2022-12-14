import 'package:demo_project1/models/user.dart';
import 'package:demo_project1/screens/authenticate/authenticate.dart';
import 'package:demo_project1/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user= Provider.of<Users?>(context);
    if(user!=null){
      return Home();
    }else{
      return Authenticate();
    }
  }
}
