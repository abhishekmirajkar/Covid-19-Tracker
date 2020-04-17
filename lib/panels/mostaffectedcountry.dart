import 'package:flutter/material.dart';
import 'package:covid19mastertracker/homepage.dart';
import 'package:covid19mastertracker/datasource.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.only(left: 10,right: 10),


      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,

          itemCount: 5,itemBuilder: (context,index){
        return Card(
          elevation: 2.0,
          child: Container(
            padding: EdgeInsets.only(top: 10),
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Column(


              children: <Widget>[

                Row(
                  children: <Widget>[
                    Image.network(countryData[index]['countryInfo']['flag'], width: 80,),
                    SizedBox(width: 20,),
                    Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('Cases',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                            Text(countryData[index]['cases'].toString(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

                          ],
                        ),

                        SizedBox(width: 30,),


                        Column(
                          children: <Widget>[
                            Text('Deaths',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                            Text(countryData[index]['deaths'].toString(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

                          ],
                        ),
                      ],
                    ),


                  ],
                ),
                  SizedBox(height: 10,),
              ],
            ),
          ),
        );
      }
      ),
    );
  }
}
