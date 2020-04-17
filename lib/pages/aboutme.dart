import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stay Safe, Stay Home"),),
      
      body: Column(
        children: <Widget>[
          Container(
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "About Us",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: "Circular",
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Image.asset(
                          "images/face.png",
                          width: 330,
                        ),
                      ],
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xff3383CD), Color(0xff11249f)])),
              ),
            ),
          ),
          
          
          Container(
            margin: EdgeInsets.only(top: 50),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                  Text("Made with "),
                  Image.asset("images/heart.png",width: 20,),
                  Text(" From")
                ],),
                SizedBox(height: 10,),
                Image.asset("images/flag.png",width: 40,),
                SizedBox(height: 10,),


                Text("Check us out"),
                SizedBox(height: 5,),

                GestureDetector(
                  onTap: (){
                    launch("https://www.instagram.com/the_logical_guy/");
                  },

                    child: Text("@the_logical_guy : App Idea, UI & Code",style: TextStyle(color: Colors.blue),)),

                SizedBox(height: 10,),

                GestureDetector(
                    onTap: (){
                      launch("https://www.instagram.com/the_vector_world/");
                      
                    },
                    child: Text("@the_vector_world : App Icon Design",style: TextStyle(color: Colors.blue),)),

                SizedBox(height: 40,),

                Text("All Copyright Reserved To \"Ultimate Hive\" "),
                GestureDetector(
                    
                    onTap: (){
                      launch("https://www.ultimatehive.com");
                    },
                    
                    child: Text("www.ultimatehive.com",style: TextStyle(color: Colors.blue),)),
                Text("\"contactus@ultimatehive.com\""),

                SizedBox(height: 10,),
                SizedBox(height: 10,),
                SizedBox(height: 10,),



                Container(
                  
                  child: GestureDetector( onTap: (){
                    launch("https://corona.lmao.ninja/");
                  }, child: Text("API Source (World Stats)",style: TextStyle(color: Colors.blue),)),
                ),
                SizedBox(height: 10,),


                Container(

                  child: GestureDetector( onTap: (){
                    launch("https://covid19-india-adhikansh.herokuapp.com/");
                  }, child: Text("API Source (India Stats)",style: TextStyle(color: Colors.blue),)),
                )





              ],)
          )
        ],
      ),
      
    );
  }
}



class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
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
