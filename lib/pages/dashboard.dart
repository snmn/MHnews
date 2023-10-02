// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:newsproject/api/getapi.dart';
import 'package:newsproject/pages/detailpage.dart';
import 'package:newsproject/static.dart';

import '../model/newsdata.dart';
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
    late Future<NewsData?> _futurenewsdata ;

@override
  void initState() {
    getfuturedata();
    // TODO: implement initState
    super.initState();
  }

  getfuturedata() {
  _futurenewsdata = GetApi().getnewsdata();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   return Scaffold(
     body: Container(
       child: FutureBuilder<NewsData?>(
          future:_futurenewsdata,
           builder: (BuildContext context, AsyncSnapshot<NewsData?> snapshot){
             switch (snapshot.connectionState){
              case ConnectionState.none:
                return Container(
                  // chid text // no internet or server error
                );
              case ConnectionState.waiting:
                return Container(); // loading
              case ConnectionState.done:
                if(snapshot.hasData){
                  var newsdata = snapshot.data;
                  return Column(
                    children: [


                      const SizedBox(height: 60,),
                      Container(
                        height: size.height/5,
                        width: size.width/1.02,
                        child: ListView.builder(
                          itemCount: newsdata!.articles!.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                //navigate to new page
                                navigatetodetail(context,"https://a.cdn-hotels.com/gdcs/production181/d1415/58842a68-207a-4fb1-a85c-102eba660798.jpg?impolicy=fcrop&w=800&h=533&q=medium");
                              },
                              child: CardModules.Cards(size,
                                  newsdata.articles![index].title!,
                                  newsdata.articles![index].publishedAt,
                                  newsdata.articles![index].urlToImage),
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
                  ); //ui
                }else{
                  return Center(
                    child: Container(
                      child: Center(child: Text("No Data")),
                    ),
                  );
                }

              default:
                return Container(); // error //page


            }
           },),
     ),
   );
  }

}