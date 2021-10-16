// @dart=2.9
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycovid19updates/dataSource.dart';
import 'package:mycovid19updates/pages/countryPage.dart';
import 'package:mycovid19updates/pages/helpline.dart';
import 'package:mycovid19updates/pages/hospitalbeds.dart';
import 'package:mycovid19updates/pages/india.dart';
import 'package:mycovid19updates/panels/infoPanel.dart';
import 'package:mycovid19updates/panels/mostaffectedcountries.dart';
import 'package:mycovid19updates/panels/webview.dart';
import 'package:mycovid19updates/panels/worldwidePanel.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String email = "covidupdate29@gmail.com";

   _launchEmail(String email) async{
    var url = "mailto:${email}";
    if (await canLaunch(url)) {
      await launch(url);
    }
    else {
      throw 'An Error Occurred!';
    }
  }

  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get(Uri.parse("https://disease.sh/v3/covid-19/all"));       //https://corona.lmao.ninja/v2/all this api is not working
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response = await http.get(Uri.parse("https://disease.sh/v3/covid-19/countries?sort=cases"));
    setState(() {
      countryData = json.decode(response.body);
    });
  }


  Future fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    fetchWorldWideData();
    fetchCountryData();
    print('fetchData function called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();

  }

  bool _drawerIsOpened;
 


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("COVID-19 UPDATE"),
        ),
        drawer: Drawer(
          child: Container(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(

                  padding: EdgeInsets.zero,
                  child: UserAccountsDrawerHeader(

                    margin: EdgeInsets.zero,
                    accountName: Text("COVID-19 UPDATE",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),

                    currentAccountPicture:
                    CircleAvatar(
                     // backgroundColor: primaryBlack,
                      foregroundColor: primaryBlack,
                      radius: MediaQuery.of(context).size.width,
                      backgroundImage: AssetImage("assets/covidlogo84.png"),
                    ), accountEmail: Text(email),
                  ),
                ),
                ListTile(
                  trailing: Icon(CupertinoIcons.arrow_right_circle_fill,color: primaryBlack,),
                  leading: Icon(
                    CupertinoIcons.location,
                    color: primaryBlack,
                  ),
                  title: Text(
                    "INDIA",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      color: primaryBlack,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => India()));

                  },
                ),
                ListTile(
                  trailing: Icon(CupertinoIcons.arrow_right_circle_fill,color: primaryBlack,),
                  leading: Icon(
                    CupertinoIcons.plus_square,
                    color: primaryBlack,

                  ),
                  title: Text(
                    "HOSPITAL STATS",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      color: primaryBlack,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => HospitalBeds()));

                  },
                ),
                ListTile(
                  trailing: Icon(CupertinoIcons.arrow_right_circle_fill,color: primaryBlack,),
                  leading: Icon(
                    CupertinoIcons.phone,
                    color: primaryBlack,

                  ),
                  title: Text(
                    "HELPLINE",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      color: primaryBlack,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Helpline()));

                  },
                ),
                Divider(),
                ListTile(
                  trailing: Icon(CupertinoIcons.arrow_right_circle_fill,color: primaryBlack,),
                  leading: Icon(
                    CupertinoIcons.bolt,
                    color: primaryBlack,

                  ),
                  title: Text(
                    "VACCINATION",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      color: primaryBlack,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>View("https://selfregistration.cowin.gov.in/")));
                   // launch('https://selfregistration.cowin.gov.in/');
                  },
                ),
                ListTile(
                  trailing: Icon(CupertinoIcons.arrow_right_circle_fill,color: primaryBlack,),
                  leading: Icon(
                    CupertinoIcons.money_dollar_circle,
                    color: primaryBlack,

                  ),
                  title: Text(
                    "DONATE",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      color: primaryBlack,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>View("https://www.pmcares.gov.in/en/")));
                    //launch('https://www.pmcares.gov.in/en/');
                  },
                ),
                ListTile(
                  trailing: Icon(CupertinoIcons.arrow_right_circle_fill,color: primaryBlack,),
                  leading: Icon(
                    CupertinoIcons.arrowtriangle_right,
                    color: primaryBlack,

                  ),
                  title: Text(
                    "MYTH BUSTERS",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      color: primaryBlack,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>View("https://transformingindia.mygov.in/covid-19/?sector=myth-busters&type=en")));
                    //launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
                  },
                ),
                // ListTile(
                //   trailing: Icon(CupertinoIcons.arrow_right_circle_fill,color: primaryBlack,),
                //   leading: Icon(
                //     CupertinoIcons.question_circle,
                //     color: primaryBlack,
                //
                //   ),
                //   title: Text(
                //     "FAQS",
                //     textScaleFactor: 1.3,
                //     style: TextStyle(
                //       color: primaryBlack,
                //     ),
                //   ),
                //   onTap: () {
                //     Navigator.push(
                //         context, MaterialPageRoute(builder: (context) => FAQPage()));
                //   },
                // ),
                Divider(),
                ListTile(
                  trailing: Icon(CupertinoIcons.arrow_right_circle_fill,color: primaryBlack,),
                  leading: Icon(
                    CupertinoIcons.at,
                    color: primaryBlack,

                  ),
                  title: Text(
                    "QUERIES/FEEDBACK",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      color: primaryBlack,
                    ),
                  ),
                  onTap: () {
                    _launchEmail(email);
                  },
                ),
              ],
            ),
          ),
        ),
        onDrawerChanged: (isopened) => _drawerIsOpened = isopened,
        body: WillPopScope(
        onWillPop: () {
          if (_drawerIsOpened == true) {


          Navigator.of(context).pop(); // close the drawer
          return Future.value(false); // don't close the app
         }
          return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("Do you really want to exist the app ?"),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text("No"),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text("Yes"),
                        ),
                      ],
                    )); // clo
        },
          child: RefreshIndicator(
            onRefresh: fetchData,
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      color: Colors.orange[100],
                      child: Text(DataSource.quote,
                      style: TextStyle(color: Colors.orange[800],fontWeight: FontWeight.bold,fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Worldwide",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => CountryPage()));
                            },
                            child: Container(

                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: primaryBlack,
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text("Regional",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)),
                          ),
                      ], ),
                    ),
                    worldData==null ? Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator()) : WorldWidePanel(worldData: worldData,),
                    Divider(),
                    worldData==null ? Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator()) :
                    PieChart(
                      chartRadius: MediaQuery.of(context).size.width / 2,
                      dataMap: {
                      'Confirmed':worldData['cases'].toDouble(),
                      'Active':worldData['active'].toDouble(),
                      'Recovered':worldData['recovered'].toDouble(),
                      'Deaths':worldData['deaths'].toDouble()
                      },
                      colorList: [
                        Colors.red,
                        Colors.blue[300],
                        Colors.green,
                        Colors.grey[400]
                      ],
                      chartValuesOptions: ChartValuesOptions(
                        showChartValuesInPercentage: true
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      child: Text("Most Affected Countries",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    ),
                   countryData==null ? Container(
                       alignment: Alignment.center,
                       child: CircularProgressIndicator()) : MostAffectedPanel(countryData: countryData,),
                    Divider(),
                    SizedBox(height: 5,),
                    InfoPanel(),
                    SizedBox(height: 15,),
                    Center(child: Text("\"दवाई भी और कड़ाई भी। \nTogether, India will defeat COVID-19\"",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                    SizedBox(height: 15,),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
