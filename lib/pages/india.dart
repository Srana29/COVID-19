// @dart=2.9


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mycovid19updates/pages/statesearch.dart';

class India extends StatefulWidget {
  const India({Key key}) : super(key: key);

  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {

  List indiaData;
    fetchIndiaData() async {
    var response = await Dio().get("https://api.rootnet.in/covid19-in/stats/latest");
    setState(() {
      indiaData = response.data['data']['regional'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchIndiaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            showSearch(context: context, delegate: StateSearch(indiaData));
          },
              icon: Icon(Icons.search))
        ],
        title: Text('India Statewise Stats'),),
      body: indiaData==null ? Center(child: CircularProgressIndicator(),) : ListView.builder(itemBuilder: (context,index){
        return Card(
          child: Container(
            height: 140,
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
                Expanded(child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(indiaData[index]['loc'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 5,),
                      Text('Confirmed: ${indiaData[index]['totalConfirmed'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                     // Text('Active: ${indiaData[index]['active'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[900]),),
                      Text('Recovered: ${indiaData[index]['discharged'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                      Text('Deaths: ${indiaData[index]['deaths'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[900]),),

                    ],
                  ),
                ),
                ),
              ],
            ),
          ),
        );
      },
        itemCount: indiaData==null ? 0 : indiaData.length,
      ),
    );
  }
}
