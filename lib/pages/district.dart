import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class DistData extends StatefulWidget {
  @override
  _DistDataState createState() => _DistDataState();
}

class _DistDataState extends State<DistData> {

  List indiaDistData;
  List temp;
  fetchCountryData()async{


    http.Response response= await http.get('https://api.covid19india.org/v2/state_district_wise.json');
    print(response);

    setState(() {
      indiaDistData = json.decode(response.body);
      //print(indiaDistData[6]);





      // print(indiaDistData[0]['districtData'][1]['district']);
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

          //showSearch(context: context, delegate: Search(countryData));

        })
      ],title: Text("Citywise Info"),),

      body: indiaDistData==null? Center(child: CircularProgressIndicator(),) :   ListView.builder(
          itemCount: indiaDistData==null ? 0 : indiaDistData.length
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

                        //temp=indiaDistData[index]['districtData'],
                        //Text(temp[index].toString()),


                        Text(indiaDistData[index]['districtData'].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                       // Text(indiaDistData[index]['districtData'][index].toString(),style: TextStyle(fontWeight: FontWeight.bold),),


                        SizedBox(width: 10,),

                        Container(
                          width: 30,
                         // child:
                          //Image.network(indiaDistData[index]['countryInfo']['flag'].toString()),
                        ),


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
                            //Text(indiaDistData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.w500),)


                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Image.asset("images/mask.png",width: 25,),
                            SizedBox(height: 5,),


                            Text("Active",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                          //  Text(indiaDistData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.w500),)


                          ],
                        ),
                        Column(
                          children: <Widget>[

                            Image.asset("images/gtick.png",width: 25,),
                            SizedBox(height: 5,),


                            Text("Recovered",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                           // Text(indiaDistData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.w500),)


                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Image.asset("images/rtick.png",width: 25,),
                            SizedBox(height: 5,),

                            Text("Deaths",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                          //  Text(indiaDistData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.w500),),

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
