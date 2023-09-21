
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CardModules {
  static Widget Cards(var size,String title, date, imageurl) {
    return   Container(
      height: size.height/5,
      width: size.width/2,
      child: Stack(
        children: [

          Container(
            height: size.height/5,
            width: size.width/2,
            margin: const EdgeInsets.only(left: 15,right: 0),
            decoration: BoxDecoration(color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(imageurl
                  ,fit: BoxFit.cover),
            ),

          ),

          Positioned(
            left: 25,
            bottom: 30,
            child:  Container(
              width: 180,
              child:  Text(title,
                style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),maxLines: 2,),
            ),
          ),

          Positioned(
            left: 25,
            bottom: 8,
            child:  Container(
              width: 200,
              child:  Text(date,
                style: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.normal),maxLines: 1,),
            ),
          ),

          const Positioned(
              right: 25,
              bottom: 5,
              child: Icon(Icons.play_circle_fill,color: Colors.white,))

        ],
      ),
    );
  }
}