import 'package:demo_project1/services/auth.dart';
import 'package:demo_project1/shared/constants.dart';
import 'package:demo_project1/shared/loading.dart';
import 'package:flutter/material.dart';
class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey= GlobalKey<FormState>();
  bool loading =false;
  String email='';
  String password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to order!'),
        actions: <Widget>[
          TextButton.icon(
            icon:Icon(Icons.person),
            label:Text('Register'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ]
      ),
      body : Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child:Form(
            key:_formKey,
          child:Column(
            children: <Widget>[
              SizedBox(height:21.0),
              TextFormField(
                decoration:textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val)=> (val==null || val.isEmpty) ? 'Enter a email' : null,
                onChanged: (val){
                  setState(() => email=val);
                },
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val)=> (val==null || val.length<6) ? 'Enter a password atleast 6 chars long' : null,
                obscureText: true,
                onChanged: (val){
                    setState(() => password=val);
                },
              ),
              SizedBox(height:20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                ),
                child: Text(
                  'Sign in',
                  style: TextStyle(color:Colors.white),
                ),
                onPressed:() async{
                  if(_formKey.currentState!.validate()){
                    setState(()=> loading=true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result==null){
                      setState(()=> error='sign in with valid email and password');
                      setState(()=> loading=false);
                    }
                    //print('valid');
                  }
                }

              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style:TextStyle(color:Colors.red,fontSize: 14.0),
              )
            ],
          )
        )

      )
    );
  }
}
