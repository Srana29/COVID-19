// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycovid19updates/dataSource.dart';
import 'package:mycovid19updates/pages/faq.dart';
import 'package:mycovid19updates/pages/resource.dart';


class InfoPanel extends StatelessWidget {
  const InfoPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // GestureDetector(
          //   onTap: () {
          //      launch('https://selfregistration.cowin.gov.in/');
          //   },
          //   child: Container(
          //     margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          //     padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
          //     color: primaryBlack,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text("VACCINATION SLOT BOOKING",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
          //         Icon(Icons.arrow_forward,color: Colors.white,)
          //       ],
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FAQPage()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("FAQS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     launch('https://www.pmcares.gov.in/en/');
          //   },
          //   child: Container(
          //     margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          //     padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
          //     color: primaryBlack,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text("DONATE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
          //         Icon(Icons.arrow_forward,color: Colors.white,)
          //       ],
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Resource()));
              },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("RESOURCES",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
