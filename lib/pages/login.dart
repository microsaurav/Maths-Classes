// import 'dart:html';
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:linkable/constants.dart';
import 'package:singuplogin/Methods/Methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:singuplogin/pages/about.dart';
import 'package:singuplogin/pages/home.dart';
import 'package:singuplogin/pages/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  bool _passwordVisible = false;

  void initState() {
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return isLoading == false
        ? Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text('Login'),
                centerTitle: true,
                elevation: 0,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    })),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/pic8.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomRight,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.dstATop),
                ),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                    child: Center(
                      child: Text('Login',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 12, 0),
                    child: Text(
                      'Welcome back!Login with your credentials',
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Email'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      // keyboardType: TextInputType.text,
                      controller: _password,
                      obscureText:
                          !_passwordVisible, //This will obscure text dynamically
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // labelText: 'Password',
                        hintText: 'Enter your password',
                        // Here is key idea
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: MaterialButton(
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        minWidth: MediaQuery.of(context).size.width,
                        color: Colors.blue,
                        shape: StadiumBorder(
                            side: BorderSide(width: 2, color: Colors.blue)),
                        child: Text('Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        onPressed: () async {
                          if (_email.text.isNotEmpty &&
                              _password.text.isNotEmpty) {
                            setState(() {
                              isLoading = true;
                            });
                            // await user!.reload();
                            bool emailIsVerified = await isEmailVerified();
                            // setState(() {});
                            print(emailIsVerified);
                            if (emailIsVerified == true) {
                              logIn(_email.text, _password.text, context)
                                  .then((user) {
                                if (user != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Login Sucessful'),
                                    ),
                                  );
                                  print("Login Sucessfull");
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const About()),
                                  );
                                } else {
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   const SnackBar(
                                  //     content: Text('Login Failed'),
                                  //   ),
                                  // );
                                  print("Login Failed");
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill form Correctly '),
                                ),
                              );
                              setState(() {
                                isLoading = false;
                              });
                              print("Please fill form correctly");
                            }
                          }
                        }),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                        child: Text('Dont have an account?'),
                      ),
                      TextButton(
                          child: Text('SignUp',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Signup()),
                            );
                          })
                    ],
                  )
                ],
              ),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}
