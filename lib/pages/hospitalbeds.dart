// @dart=2.9


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class HospitalBeds extends StatefulWidget {
  const HospitalBeds({Key key}) : super(key: key);

  @override
  _HospitalBedsState createState() => _HospitalBedsState();
}

class _HospitalBedsState extends State<HospitalBeds> {

  List hospitalBedData;
  fetchIndiaData() async {
    var response = await Dio().get("https://api.rootnet.in/covid19-in/hospitals/beds");
    setState(() {
      hospitalBedData = response.data['data']['regional'];
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
        // actions: [
        //   IconButton(onPressed: () {
        //     showSearch(context: context, delegate: StateSearch(indiaData));
        //   },
        //       icon: Icon(Icons.search))
        // ],
        title: Text('India Hospital Bed Stats'),),
      body: hospitalBedData==null ? Center(child: CircularProgressIndicator(),) : ListView.builder(itemBuilder: (context,index){
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
                      Text(hospitalBedData[index]['state'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 5,),
                      Text('Total Hospitals: ${hospitalBedData[index]['totalHospitals'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[700]),),
                      // Text('Active: ${indiaData[index]['active'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[900]),),
                      Text('Total Beds: ${hospitalBedData[index]['totalBeds'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                     // Text('Deaths: ${hospitalBedData[index]['deaths'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[900]),),

                    ],
                  ),
                ),
                ),
              ],
            ),
          ),
        );
      },
        itemCount: hospitalBedData==null ? 0 : hospitalBedData.length,
      ),
    );
  }
}
