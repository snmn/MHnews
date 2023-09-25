
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:newsproject/static.dart';

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

  static Widget CardTitle (var size,String txt){
    return  Container(
        width: size.width/2,
        margin: const EdgeInsets.only(left: 15),
        child: Text(txt,
          style: StaticValues.headernews,
          overflow: TextOverflow.visible,maxLines: 2,));
  }

  static Widget VideoCard(String imgurl){
    return Stack(
      children: [
        Container(
          height: 120,
          width: 150,
          margin: const EdgeInsets.only(left: 15,right: 0),
          decoration: BoxDecoration(color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(imgurl
                ,fit: BoxFit.cover),
          ),

        ),
        const Positioned(
            top: 40,
            left: 70,
            child: Icon(Icons.play_circle_fill,color: Colors.white,size: 40,))
      ],
    );
  }

  static Widget Listtile(var size){
    return Container(
      height: size.height/7,
      width: size.width,
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          CardModules.VideoCard("https://a.cdn-hotels.com/gdcs/production181/d1415/58842a68-207a-4fb1-a85c-102eba660798.jpg?impolicy=fcrop&w=800&h=533&q=medium"),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardModules.CardTitle(size, "Today is friday and tomorrow is saturday..."),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 35,
                    width: 90,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text("Kantipur.com",style: StaticValues.urlbutton,maxLines: 1,overflow: TextOverflow.ellipsis)),
                  ),

                  const Text("22nd Sept 2023",style: TextStyle(color: Colors.grey,fontSize: 10),)
                ],
              )
            ],
          )

        ],
      ),
    );
  }
}