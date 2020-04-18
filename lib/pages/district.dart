import 'package:flutter/material.dart';
import 'package:covid19mastertracker/pages/searchdist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class DistData extends StatefulWidget {
  @override
  _DistDataState createState() => _DistDataState();
}

class _DistDataState extends State<DistData> {

  List indiaDistData;
  List distdata = new List();
  fetchCountryData()async{


    http.Response response= await http.get('https://api.covid19india.org/v2/state_district_wise.json');
    print(response);

    setState(() {
      indiaDistData = json.decode(response.body);
      //print(indiaDistData);

      //print(indiaDistData['Kerala']['districtData']);



      //print(indiaDistData[0]['districtData'][1]['confirmed']);
     // print(indiaDistData[0]['districtData'].length);




      //print("IGNORE ME");
      //print(indiaDistData[0]['districtData'][0]);


    });
  }
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

          showSearch(context: context, delegate: SearchDist(indiaDistData));

        })
      ],title: Text("Districtwise Info"),),



      body: indiaDistData==null? Column(
        children: <Widget>[
          Center(child: CircularProgressIndicator(),),
          Center(child: Text("It's not the app, it's your internet connection")),

        ],
      ) :   ListView.builder(

        shrinkWrap: true,

          itemCount: indiaDistData.length,

          itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.all(15),
          //height: 60,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10),boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 10,offset: Offset(3, 4))]),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              Container(
                  margin: EdgeInsets.only(top: 10),

                  child: Text(indiaDistData[index]['state'].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset("images/location.png",width: 30,),

                        SizedBox(height: 10,),



                        Text("Disctrict",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.green)),

                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset("images/mask.png",width: 30,),
                        SizedBox(height: 10,),

                        Text("Total Cases",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.blue),),
                      ],
                    ),

                  ],
                ),
              ),



              Container(
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: indiaDistData[index]['districtData'].length,
                    itemBuilder: (context,index1){
                  return Container(
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Column(
                          children: <Widget>[
                            Text(indiaDistData[index]['districtData'][index1]['district'].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Column(
                          children: <Widget>[

                            Row(

                              children: <Widget>[
                                Text(indiaDistData[index]['districtData'][index1]['confirmed'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[500]),),

                              ],
                            ),


                          ],
                        ),



                      ],
                    ),
                  );

                    }),
              ),



            ],
          ),
        );
      }),
    );

  }
}
