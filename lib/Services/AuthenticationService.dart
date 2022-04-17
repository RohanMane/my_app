import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //registration with email and password

  Future createNewUser(String username, String password) async{
    try{

      UserCredential result = await _auth
          .createUserWithEmailAndPassword(
          email: username, password: password);

      User? user = result.user;
      return user;
    } catch(e){
      print(e.toString());
    }
  }

  Future loginUser(String username, String password) async{
    try{
      UserCredential result = await _auth
          .signInWithEmailAndPassword(
          email: username, password: password);


      User? user = result.user;
      return result.user;
    }
    catch(e){
      print(e.toString());
    }
  }


}
