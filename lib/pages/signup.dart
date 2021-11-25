import 'package:flutter/material.dart';
import 'package:singuplogin/Methods/Methods.dart';
import 'package:singuplogin/pages/home.dart';
import 'package:singuplogin/pages/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return isLoading == false
        ? Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text('Signup'),
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
              child: ListView(children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Create an account, its free',
                      style: TextStyle(fontSize: 20, letterSpacing: 2.0)),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text('Email',
                            style: TextStyle(fontSize: 15, letterSpacing: 2)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Email'),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text('Password',
                            style: TextStyle(fontSize: 15, letterSpacing: 2)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
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
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: MaterialButton(
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        minWidth: MediaQuery.of(context).size.width,
                        shape: StadiumBorder(
                            side: BorderSide(width: 2, color: Colors.red)),
                        color: Colors.red,
                        child: Text('Signup',
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
                            createAccount(_email.text, _password.text)
                                .then((user) {
                              if (user != null) {
                                setState(() {
                                  isLoading = true;
                                });

                                verifyEmail();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Verification Email Has been sent '),
                                  ),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Singup Failed'),
                                  ),
                                );
                                print("Singup Failed");
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Please Provide the required details'),
                              ),
                            );
                            print('Please provide the required details');
                          }
                        }),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                    child: Row(
                      children: [
                        Text('Already Have an account?',
                            style: TextStyle(
                              letterSpacing: 2,
                            )),
                        TextButton(
                            child: Text('Login',
                                style: TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            }),
                      ],
                    ),
                  )
                ]),
              ]),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
