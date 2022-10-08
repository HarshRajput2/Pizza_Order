import 'package:demo_project1/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth =  FirebaseAuth.instance;

  Users? _userFromFirebaseUser(User? user){
          if(user==null) {
            return null;
          }else {
            return Users(uid: user.uid);
          }

  }

  Stream <Users?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }
  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();

        User ?user=result.user;
        return _userFromFirebaseUser(user);


    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User ?user=result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User ?user=result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}

