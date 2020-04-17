import 'package:covid19mastertracker/datasource.dart';
import 'package:flutter/material.dart';
import 'package:covid19mastertracker/homepage.dart';

void main(){

  runApp(MaterialApp(

    theme: ThemeData(fontFamily: 'Circular',
    primaryColor: primaryBlack


    ),

    home: HomePage(),
  ));

}