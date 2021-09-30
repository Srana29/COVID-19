// @dart=2.9
import 'package:flutter/material.dart';

class StateSearch extends SearchDelegate {

  final List stateList;

  StateSearch(this.stateList);

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: () {
        query='';
      },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: () {
      Navigator.pop(context);
    },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    final suggestionList =
    query.isEmpty ?
    stateList : stateList.where((element) =>
        element['loc'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
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
                        Text(suggestionList[index]['loc'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(height: 5,),
                        Text('Confirmed: ${suggestionList[index]['totalConfirmed'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                        // Text('Active: ${indiaData[index]['active'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[900]),),
                        Text('Recovered: ${suggestionList[index]['discharged'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                        Text('Deaths: ${suggestionList[index]['deaths'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[900]),),

                      ],
                    ),
                  ),
                  ),
                ],
              ),
            ),
          );
        });
  }

}