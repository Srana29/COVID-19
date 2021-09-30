// @dart=2.9
import 'package:flutter/material.dart';

class Search extends SearchDelegate {

  final List countryList;

  Search(this.countryList);

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
    countryList : countryList.where((element) =>
        element['country'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
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
                    Text(suggestionList[index]['country'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Image.network(suggestionList[index]['countryInfo']['flag'],height: 50,width: 60,),

                  ],
                ),
              ),
              Expanded(child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Confirmed: ${suggestionList[index]['cases'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                    Text('Active: ${suggestionList[index]['active'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[900]),),
                    Text('Recovered: ${suggestionList[index]['recovered'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
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