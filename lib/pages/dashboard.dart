import 'package:flutter/material.dart';
import 'package:newsproject/static.dart';

import '../modules/cards.dart';

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }

}
class DashboardState extends State<Dashboard>{



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   return Scaffold(
     body: Column(
       children: [
         const SizedBox(height: 60,),
         Container(
           height: size.height/5,
           width: size.width/1.02,
           child: ListView.builder(
             itemCount: 5,
             physics: const AlwaysScrollableScrollPhysics(),
             scrollDirection: Axis.horizontal,
             itemBuilder: (context, index) {
               return CardModules.Cards(size,
                   "Digital wallets in nepal..",
                   "Sept 21 2023",
                   "https://a.cdn-hotels.com/gdcs/production181/d1415/58842a68-207a-4fb1-a85c-102eba660798.jpg?impolicy=fcrop&w=800&h=533&q=medium");
             },
           ),
         ),

         Container(
           height: size.height/1.5,
           width:size.width,
           child: ListView.builder(
             itemCount: 6,
             physics: const AlwaysScrollableScrollPhysics(),
             scrollDirection: Axis.vertical,
             itemBuilder: (context,index){
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
             },
           )
         )
       ],
     ),
   );
  }

}