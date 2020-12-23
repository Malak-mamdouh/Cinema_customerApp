import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signUp(String email , String password) async //future because it takes a while
  {
    final authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password); //await must to be used because this method takes a while to implement

    return authResult;
  }
  Future<UserCredential> signIn(String email , String password) async
  {
    final authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);

    return authResult;
  }

}