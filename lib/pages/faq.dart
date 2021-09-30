// @dart=2.9
import 'package:flutter/material.dart';
import 'package:mycovid19updates/dataSource.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAQs"),),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context,index){
        return ExpansionTile(title: Text(DataSource.questionAnswers[index]['question'],style: TextStyle(fontWeight: FontWeight.bold),),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(DataSource.questionAnswers[index]['answer']),
          ),
        ],
        );
       },
      ),
    );
  }
}
