import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:singuplogin/pages/about.dart';
import 'package:singuplogin/pages/home.dart';

Future<User?> createAccount(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print('Registered Sucessfully');
      return user;
    } else {
      print('Account creation failed');
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password, BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  await auth.signOut();
  try {
    User? user = (await auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print('Login Sucessful');
      showSnackBar(context, 'Login Suceessful');

      return user;
    } else {
      print('User registration denied');
      showSnackBar(context, 'User registration denied');
      return user;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showSnackBar(context, 'User Not Found');
    } else if (e.code == 'Wrong Password') {
      showSnackBar(context, 'Wrong Password');
    }
    print(e);

    return null;
  }
}

Future logOut() async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    await auth.signOut();
  } catch (e) {
    print("error");
  }
}

Future<void> verifyEmail() async {
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = await auth.currentUser;

    user!.sendEmailVerification();
    await user.reload();
    log('Email verification has been sent', name: 'verification');
  } catch (e) {
    print(e);
  }
}

Future<bool> isEmailVerified() async {
  User? user = FirebaseAuth.instance.currentUser;
  await user!.reload();
  bool emailVerified = await user.emailVerified;
  try {
    if (emailVerified == true) {
      await FirebaseAuth.instance.currentUser?.getIdToken(true);
      log('Email is verified', name: 'verify');
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}

final storage = new FlutterSecureStorage();

Future<void> verifyPhoneNumber(
    String phoneNumber, BuildContext context, Function setData) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  PhoneVerificationCompleted verificationCompleted =
      (PhoneAuthCredential phoneAuthCredential) async {
    showSnackBar(context, 'Verification Completed');
  };
  PhoneVerificationFailed verificationFailed =
      (FirebaseAuthException exception) {
    showSnackBar(context, exception.toString());
  };
  PhoneCodeSent codeSent = (String verificationID, [int? forceResendingtoken]) {
    showSnackBar(context, "Verification Code is sent to the phone number");
    setData(verificationID);
  };

  PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
      (String verificationID) {
    showSnackBar(context, "Time out");
  };

  try {
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  } catch (e) {
    showSnackBar(context, e.toString());
  }
}

Future<void> signInwithPhoneNumber(
    String verificationId, String smsCode, BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    UserCredential userCredential = await auth.signInWithCredential(credential);
    storeTokenAndData(userCredential);

    Navigator.push(context, MaterialPageRoute(builder: (builder) => About()));
    showSnackBar(context, "Logged In");
  } catch (e) {
    showSnackBar(context, e.toString());
  }
}

void storeTokenAndData(UserCredential userCredential) async {
  print("storing token and data");
  await storage.write(
      key: "token", value: userCredential.credential!.token.toString());
  await storage.write(key: "usercredential", value: userCredential.toString());
}

Future<String?> getToken() async {
  return await storage.read(key: "token");
}

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// Future<User?> logIn(String email, String password) async {
//       FirebaseAuth auth = FirebaseAuth.instance;
//       await auth.signOut();
//       try {
//         User? user = (await auth.signInWithEmailAndPassword(
//                 email: email, password: password))
//             .user;

//         if (user != null) {
//           print('Login Sucessful');

//           return user;
//         } else {
//           print('User registration denied');
//           return user;
//         }
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found') {
//           print("No User Found for that Email");
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.black,
//               content: Text(
//                 "No User Found for that Email",
//                 style: TextStyle(fontSize: 18.0, color: Colors.black),
//               ),
//             ),
//           );
//         } else if (e.code == 'wrong-password') {
//           print("Wrong Password Provided by User");
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.black,
//               content: Text(
//                 "Wrong Password Provided by User",
//                 style: TextStyle(fontSize: 18.0, color: Colors.black),
//               ),
//             ),
//           );
//         }
//       }
//     }