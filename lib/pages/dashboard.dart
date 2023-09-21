import 'package:flutter/material.dart';

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
         SizedBox(
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

         Container()
         

         
         
       ],
     ),
   );
  }

}