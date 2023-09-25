import 'package:flutter/material.dart';
import 'package:newsproject/pages/detailpage.dart';
import 'package:newsproject/static.dart';

import '../modules/cards.dart';

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }

}
class DashboardState extends State<Dashboard>{

 navigatetodetail(BuildContext context,String imgurl){
   return Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(imgurl)));
 }

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
               return GestureDetector(
                 onTap: (){
                   //navigate to new page
                   navigatetodetail(context,"https://a.cdn-hotels.com/gdcs/production181/d1415/58842a68-207a-4fb1-a85c-102eba660798.jpg?impolicy=fcrop&w=800&h=533&q=medium");
                 },
                 child: CardModules.Cards(size,
                     "Digital wallets in nepal..",
                     "Sept 21 2023",
                     "https://a.cdn-hotels.com/gdcs/production181/d1415/58842a68-207a-4fb1-a85c-102eba660798.jpg?impolicy=fcrop&w=800&h=533&q=medium"),
               );
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
               return GestureDetector(
                 onTap: (){
                   //navigate to new page
                   navigatetodetail(context,"https://a.cdn-hotels.com/gdcs/production181/d1415/58842a68-207a-4fb1-a85c-102eba660798.jpg?impolicy=fcrop&w=800&h=533&q=medium");
                 },
                 child: CardModules.Listtile(size),
               );
             },
           )
         )
       ],
     ),
   );
  }

}