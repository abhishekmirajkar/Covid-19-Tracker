import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class IndiaData extends StatefulWidget {
  @override
  _IndiaDataState createState() => _IndiaDataState();
}

class _IndiaDataState extends State<IndiaData> {

  Map indiaStateData;
  fetchCountryData()async{


    http.Response response= await http.get('https://covid19-india-adhikansh.herokuapp.com/states');
    print(response);

    setState(() {
      indiaStateData = json.decode(response.body);


    });
  }



  @override

  void initState() {
    fetchCountryData();
    // TODO: implement initState
    super.initState();
  }



  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: false,
        title: Text("India's Statewise Info"),
      ),

      body: indiaStateData==null? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(child: CircularProgressIndicator(),),
          Text("It's not the app, it's your internet connection"),

        ],
      ) :   ListView.builder(
          itemCount: indiaStateData==null ? 0 : 33
          ,itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.all(15),
          height: 140,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10),boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 10,offset: Offset(3, 4))]),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Row(
                      children: <Widget>[

                        Text(indiaStateData['state'][index]['name'],style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(width: 10,),




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
                            Text(indiaStateData['state'][index]['total'].toString(),style: TextStyle(fontWeight: FontWeight.w500),)


                          ],
                        ),

                        Column(
                          children: <Widget>[
                            Image.asset("images/mask.png",width: 25,),
                            SizedBox(height: 5,),

                            Text("Active",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                            Text(indiaStateData['state'][index]['confirmed'].toString(),style: TextStyle(fontWeight: FontWeight.w500),)


                          ],
                        ),

                        Column(
                          children: <Widget>[
                            Image.asset("images/gtick.png",width: 25,),
                            SizedBox(height: 5,),

                            Text("Recovered",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                            Text(indiaStateData['state'][index]['cured'].toString(),style: TextStyle(fontWeight: FontWeight.w500),)


                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Image.asset("images/rtick.png",width: 25,),
                            SizedBox(height: 5,),

                            Text("Deaths",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                            Text(indiaStateData['state'][index]['death'].toString(),style: TextStyle(fontWeight: FontWeight.w500),),

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
