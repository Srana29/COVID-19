// @dart=2.9
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mycovid19updates/pages/search.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {


  List countryData;
  fetchCountryData() async {
    http.Response response = await http.get(Uri.parse("https://corona.lmao.ninja/v2/countries?sort=cases"));
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            showSearch(context: context, delegate: Search(countryData));
          },
              icon: Icon(Icons.search))
        ],
        title: Text('Country Stats'),),
      body: countryData==null ? Center(child: CircularProgressIndicator(),) : ListView.builder(itemBuilder: (context,index){
        return Card(
          child: Container(
            height: 130,
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(
                color: Colors.grey[100],
                blurRadius: 10,
                offset: Offset(0,10)
              )],
            ),
            child: Row(
              children: [
                Container(

                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                     Image.network(countryData[index]['countryInfo']['flag'],height: 50,width: 60,),

                   ],
                  ),
                ),
                Expanded(child: Container(
                  margin: EdgeInsets.all(20),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('Confirmed: ${countryData[index]['cases'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                       Text('Active: ${countryData[index]['active'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[900]),),
                       Text('Recovered: ${countryData[index]['recovered'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                       Text('Deaths: ${countryData[index]['deaths'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[900]),),

                     ],
                   ),
                 ),
                ),
              ],
            ),
          ),
        );
      },
        itemCount: countryData==null ? 0 : countryData.length,
      ),
    );
  }
}

