import 'package:flutter/material.dart';
import 'package:covid19mastertracker/pages/searchdist.dart';

class SearchDist extends SearchDelegate {
  final List indiaDistData;

  SearchDist(this.indiaDistData);





  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggesstionCountry = query.isEmpty
        ? indiaDistData
        : indiaDistData
        .where((element) =>
        element['state'].toString().toLowerCase().startsWith(query))
        .toList();

    // TODO: implement buildSuggestions
    return ListView.builder(

        shrinkWrap: true,

        itemCount: suggesstionCountry.length,

        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.all(15),
            //height: 60,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10),boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 10,offset: Offset(3, 4))]),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                //Text(suggesstionCountry.length.toString()),


                Container(
                    margin: EdgeInsets.only(top: 10),

                    child: Text(suggesstionCountry[index]['state'].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),

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
                      itemCount: suggesstionCountry[index]['districtData'].length,
                      itemBuilder: (context,index1){
                        return Container(
                          child: Row(

                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Column(
                                children: <Widget>[
                                  Text(suggesstionCountry[index]['districtData'][index1]['district'].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Column(
                                children: <Widget>[

                                  Row(

                                    children: <Widget>[
                                      Text(suggesstionCountry[index]['districtData'][index1]['confirmed'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[500]),),

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
        });
  }
}
