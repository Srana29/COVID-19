// @dart=2.9
import 'package:flutter/material.dart';
import 'package:mycovid19updates/dataSource.dart';

class Resource extends StatelessWidget {
  const Resource({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resources"),),
      body: ListView.builder(
        itemCount: DataSource.resources.length,
        itemBuilder: (context,index){
          return ExpansionTile(title: Text(DataSource.resources[index]['resource'],style: TextStyle(fontWeight: FontWeight.bold),),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(DataSource.resources[index]['ans']),
              ),
            ],
          );
        },
      ),
    );
  }
}
