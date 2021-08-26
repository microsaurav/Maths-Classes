import 'package:flutter/material.dart';

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
        title: Text('Authentication',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Hello There!',
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                  child: Text(
                      'Automatic identity verification which enable you to verify your identity',
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ),
                SizedBox(height: 30.0),
                Container(
                    child: Image.asset(
                  'assets/boy.png',
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
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      textColor: Colors.white,
                      minWidth: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                      child: Text('Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {},
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
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      minWidth: MediaQuery.of(context).size.width,
                      color: Colors.red,
                      child: Text('Signup',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
