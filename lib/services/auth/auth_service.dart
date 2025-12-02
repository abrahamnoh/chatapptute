
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//todo esto es para la autenticacion y el login pero en una explicacion mas larga se diria que es para manejar todo lo relacionado con la autenticacion de usuarios en la aplicacion
class AuthService {
  // instance of auth

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  // sign in
  Future<UserCredential> signInWithEmailPassword(String email, passwoord) async {
    try {
      //sing user in
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: passwoord,
      );

      // Save user info if it doesn't already exist
      _firestore.collection("users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        }
      );
      return userCredential;

    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  } 

  // sign up esto nos servira para registrar nuevos usuarios
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      //create user
      UserCredential userCredential = 
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );


      // Save user info in a separate doc 
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email,
        }
      );



      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out y esto nos servira para cerrar sesion
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  // errors
  
}