import 'package:covid19mastertracker/datasource.dart';
import 'package:flutter/material.dart';



class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("How to Protect Yourself & Others"),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(
              child: Image.asset("images/img.png"),
            ),
            ListView.builder(
              shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            
            itemCount: DataSource.questionAnswers.length,
                itemBuilder: (context,index){
              return Column(
                children: <Widget>[

                  ExpansionTile(
                    title: Text(DataSource.questionAnswers[index]['question'].toString()),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(DataSource.questionAnswers[index]['answer'].toString()),
                    )
                    ],),
                ],
              );

            }),
          ],
        ),
      ),
    );
  }
}
