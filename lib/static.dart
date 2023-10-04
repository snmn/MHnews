import 'package:flutter/material.dart';

import 'model/newsdata.dart';

class StaticValues{

  static TextStyle headernews = const TextStyle(color: Colors.black,
      fontWeight: FontWeight.bold,overflow: TextOverflow.visible,fontSize: 16,fontFamily: 'Poppins');

  static TextStyle urlbutton = const TextStyle(color: Colors.white,fontSize: 11);

  static List<Articles>? listofarticles = [];

  static String defaultimg = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDXGOplHCBm-kPZOZLUtfI_UKITTWyHxS2aF8Wzb_4&s";

}