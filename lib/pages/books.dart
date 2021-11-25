import 'package:flutter/material.dart';
import 'package:singuplogin/pages/about.dart';
import 'package:singuplogin/pages/map.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class Service {
  final String name;
  final String link;

  Service(this.name, this.link);
}

@override
class _BookState extends State<Book> {
  List<Service> services = [
    Service('R.S Aggrawal',
        'https://www.amazon.in/Secondary-Mathematics-Aggarwal-2018-19-Session/dp/9350271478/ref=asc_df_9350271478/?tag=googleshopdes-21&linkCode=df0&hvadid=397083544241&hvpos=&hvnetw=g&hvrand=4961670692084483560&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9298433&hvtargid=pla-318320013786&psc=1&ext_vrnc=hi'),
    Service('NCERT',
        'https://www.amazon.in/Mathematics-NCERT-Textbook-Class-English/dp/B098LMXXK4/ref=sr_1_7?dchild=1&keywords=NCERT+11&qid=1633197051&qsid=260-1513835-5302749&s=books&sr=1-7&sres=B07WLM1GW4%2CB099ZCGPMF%2C817450852X%2CB00JRS4DZE%2CB08N44RSP1%2CB089FLN1RC%2CB098LMXXK4%2CB097R9T444%2CB097R9KDBY%2CB07ZY16SQV%2CB097N3WN52%2C8174504966%2CB085HVF7D3%2CB07H5SX4WR%2CB07FW3LVDK%2CB09827ZW5T&srpt=ABIS_BOOK'),
    Service('R.D Sharma',
        'https://www.amazon.in/Sharma-Mathematics-Class-2021-2022-Session/dp/B08WLP8WS6/ref=sr_1_2?adgrpid=58711449037&dchild=1&ext_vrnc=hi&gclid=CjwKCAjw7--KBhAMEiwAxfpkWN504fWevKK9i3FJur4TEb1GE8WrfXZ8xWnrOCCR7igo3svxPoHHvRoCDcAQAvD_BwE&hvadid=294110271315&hvdev=c&hvlocphy=9298433&hvnetw=g&hvqmt=b&hvrand=457471375898183517&hvtargid=kwd-301558430057&hydadcr=23636_1725034&keywords=class+11+rd+sharma&qid=1633439757&qsid=260-1513835-5302749&sr=8-2&sres=8194192633%2CB08WLP8WS6%2CB09BB9P55K%2CB096YWXV4F%2CB09536TNWD%2CB07KDTWV8T%2CB07DN8M2X4%2C8194476577%2C9385140434%2CB09BR8YH4M%2CB08Q16BSSW%2C9385140558%2CB07KDV3ZY2%2CB07RPW6WBN%2C8194192641%2CB08DJD64FJ&srpt=ABIS_BOOK'),
    Service('S.L Loney',
        'https://www.amazon.in/TRIGONOMETRY-Elements-COORDINATE-Cartesian-Coordinates/dp/B083FZVRV9/ref=sr_1_2?crid=2946GISREOWW5&dchild=1&keywords=s.l+loney+plane+trigonometry&qid=1633679875&qsid=260-1513835-5302749&sprefix=S.l+loney%2Caps%2C359&sr=8-2&sres=9351761754%2CB083FZVRV9%2C9351448266%2CB0857H7PFK%2C812190918X%2C8183989330%2C9351448274%2C8174731202%2CB07W72YN28%2C1418185094%2CB07JYVWMX5%2C9350064480%2CB0851ZF2WQ%2CB08YDQVX25%2CB07JV8NN58%2CB0857HT79Z&srpt=ABIS_BOOK'),
    Service('K.C Sinha',
        'https://www.amazon.in/Text-Book-Calculus-Dr-K-C-Sinha/dp/B076XBYR3M/ref=sr_1_12?crid=32XCD4T2OEEEH&dchild=1&keywords=k.c+sinha&qid=1633679901&qsid=260-1513835-5302749&sprefix=k.c+sinha%2Caps%2C358&sr=8-12&sres=B01M7SCVBV%2C9350781166%2C9350781174%2C8123926812%2C9350780852%2C8193775783%2CB076XL73BV%2C9350781794%2CB093BXZ7QX%2CB076XBYR3M%2C9350781786%2C9350781514%2CB0999K9CWN%2C9382572643%2C935078176X%2CB01NCKURIH'),
    Service('Hall N Knight',
        'https://www.amazon.in/HIGHER-ALGEBRA-Hall/dp/935176253X/ref=sr_1_1?crid=MIEAHSQWNBFN&dchild=1&keywords=hall+n+knight+higher+algebra&qid=1633679940&qsid=260-1513835-5302749&sprefix=Hall+N+%2Caps%2C378&sr=8-1&sres=935176253X%2CB077MXCC9P%2CB08521CXRJ%2CB07KLZHTP7%2CB07KLS46GX%2C8174731040%2C9351448126%2C9351405575%2C9353809517%2CB0857H9JL2%2C9350943204%2C150876350X%2C9385923587%2C9350943255%2C8126510188%2C8172234988&srpt=ABIS_BOOK'),
    Service('I A MARRON',
        'https://www.amazon.in/Problems-CALCULUS-ONE-VARIABLE-Maron/dp/9351762599/ref=sr_1_3?crid=3FDUFZLTMAQ5U&dchild=1&keywords=i+a+maron+calculus&qid=1633679962&qsid=260-1513835-5302749&sprefix=I+A+ma%2Caps%2C372&sr=8-3&sres=9351762599%2C8123902522%2CB0857H8KMJ%2CB0857HHV71%2C9351448169%2CB085219M5S%2CB0857J2RV3%2CB0851ZKLCK%2CB0851ZNXQV%2CB08DJDZDMX%2CB08KQ4Q8LS%2CB08KQ2DNGR%2CB08KPZNRRF%2CB08KGXYNQ5%2CB08K5QLZSH%2CB08521CH9G&srpt=ABIS_BOOK'),
    Service('CENGAGE',
        'https://www.amazon.in/Cengage-Maths-Advanced-Editions-Colour/dp/B092FZV3YN/ref=sr_1_4?crid=3NQPT58SPRJYJ&dchild=1&keywords=cengage+maths+jee+mains+and+advanced&qid=1633679985&qsid=260-1513835-5302749&sprefix=cengage%2Caps%2C502&sr=8-4&sres=B08J4DD8N6%2CB092FZV3YN%2CB089WDHN4B%2CB08YRBBTL7%2C9353502101%2CB093Y95Q4X%2C9325298635%2C9353503779%2C9353503795%2CB07DX1WFBF%2C9325298643%2C9353503787%2C9353503817%2C9325298686%2C9353503809%2C9353504546&srpt=ABIS_BOOK'),
  ];

  int selectedService = -1;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('', style: TextStyle(fontSize: 23.0)),
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const About()),
                  );
                })),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Map()),
            );
          },
          label: Text("Map", style: TextStyle(fontSize: 15)),
          icon: Icon(
            Icons.directions,
            size: 20,
          ),
          backgroundColor: Colors.red,
        ),
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
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(70, 10, 0, 0),
                    child: Text(
                      'Books Preffered',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ];
            },
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: services.length,
                          itemBuilder: (BuildContext context, int index) {
                            return serviceContainer(
                                // services[index].imageURL,
                                services[index].name,
                                index,
                                services[index].link);
                            // FadeAnimation((1.0 + index) / 4, serviceContainer(services[index].imageURL, services[index].name, index));
                          }),
                    ),
                  ]),
            ),
          ),
        ));
  }

  serviceContainer(String name, int index, String link) {
    return GestureDetector(
      onTap: () {
        setState(() {
          launch(link);
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selectedService == index
              ? Colors.blue.shade50
              : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue
                : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/book.png', height: 80),
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
            ]),
      ),
    );
  }
}
