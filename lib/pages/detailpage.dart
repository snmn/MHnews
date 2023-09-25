import 'package:flutter/material.dart';
import 'package:newsproject/modules/cards.dart';

class DetailPage extends StatefulWidget{
  String imgurl;
  DetailPage(this.imgurl, {super.key});

  @override
  State<StatefulWidget> createState() {
    return DetailPageState(imgurl);
  }

}

class DetailPageState extends State<DetailPage>{
  String imgurl;
  DetailPageState(this.imgurl);

  navigatetodetail(BuildContext context,String imgurl){
    return Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(imgurl)));
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   return Scaffold(
     body: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const SizedBox(height: 26,),
           Stack(
             children: [
               Container(
                 height: size.height/4,
                 width: size.width,
                 child: Image.network(imgurl,fit: BoxFit.cover,)
               ),
               GestureDetector(
                 onTap: (){
                   Navigator.pop(context);
                 },
                 child: const Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                 ),
               ),
               const Positioned(
               right: 0
               ,child: Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Icon(Icons.share,color: Colors.white,size: 30,),
               )),
               Positioned(top: size.height/9,left: size.width/2.4,child: const Icon(Icons.play_circle,color: Colors.white,size: 50,))
             ],
           ),
           const SizedBox(height: 15,),
           Padding(
             padding: const EdgeInsets.only(left:15.0),
             child: Text("Silver Linings To Covid in march 2020".toUpperCase(),
               style: TextStyle(color: Colors.black,
                   fontSize: 20,fontWeight: FontWeight.bold),),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 15.0),
                 child: const Text("Season Maharjan",style: TextStyle(color: Colors.grey),),
               ),
               Padding(
                 padding: const EdgeInsets.only(right: 15.0),
                 child: const Text("20 March 2023",style: TextStyle(color: Colors.grey),),
               ),
             ],
           ),
           Padding(
             padding: const EdgeInsets.only(left:15.0,top: 10),
             child: Text("Silver Linings To Covid in march 2020 lorem ipsum Silver Linings To Covid in march 2020 lorem ipsumSilver Linings To Covid in march 2020 lorem ipsumSilver Linings To Covid in march 2020 lorem ipsumSilver Linings To Covid in march 2020 lorem ipsumSilver Linings To Covid in march 2020 lorem ipsumSilver Linings To Covid in march 2020 lorem ipsum ",
               style: TextStyle(color: Colors.black,
                   fontSize: 14,fontWeight: FontWeight.normal),),
           ),
           const SizedBox(height: 15,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Divider(height: 2,thickness: 1,color: Colors.black,),
           ),
           const SizedBox(height: 15,),
           Container(
            //   height: size.height/2.5,
               width:size.width,
               child: ListView.builder(
                 itemCount: 6,
                 shrinkWrap: true,
                 primary: true,
                 physics: const NeverScrollableScrollPhysics(),
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
     ),
   );
  }

}