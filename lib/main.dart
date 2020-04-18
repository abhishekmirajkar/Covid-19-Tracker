import 'package:covid19mastertracker/datasource.dart';
import 'package:covid19mastertracker/pages/graphs.dart';
import 'package:flutter/material.dart';
import 'package:covid19mastertracker/homepage.dart';

void main(){

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,

    theme: ThemeData(fontFamily: 'Circular',
    primaryColor: primaryBlack


    ),

    home: HomePage(),
  ));

}