import 'package:covid19mastertracker/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

  List countryData;
  fetchCountryData()async{


    http.Response response= await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');

    setState(() {
      countryData = json.decode(response.body);
    });
  }


@override
  void initState() {
  fetchCountryData();
    // TODO: implement initState
    super.initState();
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: (){

          showSearch(context: context, delegate: Search(countryData));

        })
      ],title: Text("All Countries info"),),

      body: countryData==null? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(child: CircularProgressIndicator(),),
          Text("It's not the app, it's your internet connection"),

        ],
      ) :   ListView.builder(
        itemCount: countryData==null ? 0 : countryData.length
        ,itemBuilder: (context,index){
      return Container(
        margin: EdgeInsets.all(15),
        height: 160,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10),boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 10,offset: Offset(3, 4))]),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[

                      Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),

                      Container(
                        width: 30,
                        child:
                        Image.network(countryData[index]['countryInfo']['flag'].toString()),),


                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 15,top: 10,right: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Column(
                        children: <Widget>[
                          Image.asset("images/covid.png",width: 25,),
                          SizedBox(height: 5,),

                          Text("Confirmed",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                          Text(countryData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.w500),)


                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image.asset("images/mask.png",width: 25,),
                          SizedBox(height: 5,),


                          Text("Active",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                          Text(countryData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.w500),)


                        ],
                      ),
                      Column(
                        children: <Widget>[

                          Image.asset("images/gtick.png",width: 25,),
                          SizedBox(height: 5,),


                          Text("Recovered",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                          Text(countryData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.w500),)


                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image.asset("images/rtick.png",width: 25,),
                          SizedBox(height: 5,),

                          Text("Deaths",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                          Text(countryData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.w500),),

                        ],
                      ),

                    ],
                  ),
                )

              ],
            )
          ],
        ),
      );
    }),
    );
  }
}
