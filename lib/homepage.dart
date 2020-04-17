import 'dart:convert';

import 'package:covid19mastertracker/datasource.dart';
import 'package:covid19mastertracker/pages/aboutme.dart';
import 'package:covid19mastertracker/pages/countryPage.dart';
import 'package:covid19mastertracker/pages/district.dart';
import 'package:covid19mastertracker/pages/faq.dart';
import 'package:covid19mastertracker/pages/india.dart';
import 'package:covid19mastertracker/panels/info.dart';
import 'package:covid19mastertracker/panels/mostaffectedcountry.dart';
import 'package:covid19mastertracker/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:covid19mastertracker/main.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex=0;

  final tabs =[
    Center(child: Text("HOME"),),
    Center(child: Text("India"),),
    Center(child: Text("About us"),),



  ];




  Map worldData;
  List countryData;

  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');

    setState(() {
      worldData = json.decode(response.body);
    });
  }

  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');

    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: false,
        title: Text("COVID - 19 Tracker"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Thank You Heros",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: "Circular",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          "images/back2.png",
                          width: 330,
                        ),
                      ],
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xff3383CD), Color(0xff11249f)])),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Worldwide Status",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountryPage()));
                          },
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                )),
            worldData == null
                ? CircularProgressIndicator()
                : WorldWidePanel(worldData: worldData),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Most Affected Countries",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: EdgeInsets.only(right: 20),

                  child: GestureDetector(

                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryPage()));
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            countryData == null
                ? Container()
                : MostAffectedPanel(countryData: countryData),
            InfoPanel(),
          ],
        ),
      ),



      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Colors.blue),



        BottomNavigationBarItem(
            icon: Image.asset("images/flag.png",width: 30,),
            title: Text("India Stats"),
            backgroundColor: Colors.blue),


            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("About Us"),
                backgroundColor: Colors.blue),
      ],
      onTap: (index){
            setState(() {
              _currentIndex=index;
              if (_currentIndex==1){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IndiaData()));
              }else if (_currentIndex==2){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DistData()));
              }
            });

    },
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 90);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
