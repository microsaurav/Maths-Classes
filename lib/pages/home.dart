import 'package:flutter/material.dart';
import 'package:singuplogin/pages/login.dart';
import 'package:singuplogin/pages/phoneAuth.dart';
import 'package:singuplogin/pages/signup.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {})),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/pic8.png"),
                fit: BoxFit.cover,
                alignment: Alignment.bottomRight,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.dstATop),
              ),
            ),
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text('D.L DAS MATHS CLASSES',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                        child: Text('Verify your identity to get Started',
                            style: TextStyle(
                              fontSize: 20.0,
                            )),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                          child: Image.asset(
                        'assets/logo.png',
                        height: 200.0,
                        fit: BoxFit.contain,
                      )),
                      SizedBox(height: 30.0),
                      // ignore: deprecated_member_use
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(90.0),
                          child: MaterialButton(
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            textColor: Colors.white,
                            minWidth: MediaQuery.of(context).size.width,
                            shape: StadiumBorder(
                                side: BorderSide(width: 2, color: Colors.blue)),
                            color: Colors.blue,
                            child: Text('Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      // ignore: deprecated_member_use
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(100.0),
                          child: MaterialButton(
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            minWidth: MediaQuery.of(context).size.width,
                            shape: StadiumBorder(
                                side: BorderSide(width: 2, color: Colors.red)),
                            color: Colors.red,
                            child: Text('Signup',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signup()),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text('or',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      SizedBox(height: 30.0),
                      // ignore: deprecated_member_use

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(100.0),
                          child: MaterialButton(
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            minWidth: MediaQuery.of(context).size.width,
                            shape: StadiumBorder(
                                side: BorderSide(width: 2, color: Colors.red)),
                            color: Colors.orange,
                            child: Text('Continue With Phone',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhoneAuthPage()),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
