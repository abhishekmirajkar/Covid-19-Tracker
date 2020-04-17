import 'package:covid19mastertracker/datasource.dart';
import 'package:covid19mastertracker/pages/faq.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),

          GestureDetector(
            onTap: (){
              
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));
              
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 45,
              color: primaryBlack,
              child: Row(
                children: <Widget>[
                  Text('How to Protect Yourself & Others',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                  Spacer(),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),

          GestureDetector(
            onTap: (){
            launch('https://www.ultimatehive.com');
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 45,
              color: primaryBlack,
              child: Row(
                children: <Widget>[
                  Text('Ultimate Hive',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                  Spacer(),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),

        ],
      ),
    );

  }
}
