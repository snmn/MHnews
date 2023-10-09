import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsproject/modules/cards.dart';
import '../model/newsdata.dart';
import '../static.dart';

class DetailPage extends StatefulWidget{
  Articles articles;
  DetailPage(this.articles, {super.key});

  @override
  State<StatefulWidget> createState() {
    return DetailPageState(articles);
  }

}

class DetailPageState extends State<DetailPage>{
  Articles articles;
  DetailPageState(this.articles);

  navigatetodetail(BuildContext context,Articles articles){
    return Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(articles)));
  }

  String formatDateTimestring(String date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime format = (dateFormat.parse(date));
    DateFormat longdate = DateFormat("MMM dd, yyyy");
    date = longdate.format(format);
    return date;
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
                 child: Image.network(articles.urlToImage==null?StaticValues.defaultimg:articles.urlToImage!,fit: BoxFit.cover,)
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
             child: Text(articles.title!.toUpperCase(),
               style: TextStyle(color: Colors.black,
                   fontSize: 20,fontWeight: FontWeight.bold),),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 15.0),
                 child:  Text(articles.author==null?"No Author":articles.author!,style: const TextStyle(color: Colors.grey),),
               ),
               Padding(
                 padding: const EdgeInsets.only(right: 15.0),
                 child:  Text(formatDateTimestring(articles.publishedAt!.replaceAll("T", " ")),style: const TextStyle(color: Colors.grey),),
               ),
             ],
           ),
           Padding(
             padding: const EdgeInsets.only(left:15.0,top: 10),
             child: Text(articles.description!,
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
                 itemCount: StaticValues.listofarticles!.length,
                 shrinkWrap: true,
                 primary: true,
                 physics: const NeverScrollableScrollPhysics(),
                 scrollDirection: Axis.vertical,
                 itemBuilder: (context,index){
                   return GestureDetector(
                     onTap: (){
                       //navigate to new page
                       navigatetodetail(context,StaticValues.listofarticles![index]);
                     },
                     child: CardModules.Listtile(size,StaticValues.listofarticles![index]),
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