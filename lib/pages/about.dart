import 'package:flutter/material.dart';
import 'package:singuplogin/pages/books.dart';
import 'package:singuplogin/pages/home.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  // late final TickerProvider vsync;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Math Classes'),
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
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Container(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: size.width / 3,
                          height: size.height / 2.8,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    backgroundImage: AssetImage(
                                      "assets/pic.png",
                                    ),
                                    radius: size.height / 7),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "D.L DAS",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Info:",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'BSc(Hons),MSc(Maths).\n'
                              'A great guide and mentor,Has an experience of 30 years of teaching.'
                              'Has Produced many IITIANs and many students cracked NDA under his Guidance',
                              style: TextStyle(
                                fontSize: 19.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Container(
                        width: size.width / 1.4,
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                          minWidth: MediaQuery.of(context).size.width,
                          color: Colors.blue,
                          shape: StadiumBorder(
                              side: BorderSide(width: 2, color: Colors.blue)),
                          child: Text('Books Preferred / Location',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Book()),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Container(
                        width: size.width / 3,
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                          minWidth: MediaQuery.of(context).size.width,
                          color: Colors.blue,
                          shape: StadiumBorder(
                              side: BorderSide(width: 2, color: Colors.blue)),
                          child: Text('Join Class',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                          onPressed: () {
                            _launchURL();
                          },
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}

_launchURL() async {
  const url = 'https://forms.gle/XEpPLGuutbAPEbj78';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
