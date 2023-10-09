// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:newsproject/api/getapi.dart';
import 'package:newsproject/pages/detailpage.dart';
import 'package:newsproject/static.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/newsdata.dart';
import '../modules/cards.dart';
import 'loginpage.dart';

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }

}
class DashboardState extends State<Dashboard>{

 navigatetodetail(BuildContext context,Articles articles){
   return Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(articles)));
 }
    late Future<NewsData?> _futurenewsdata ;

@override
  void initState() {
    getfuturedata();
    // TODO: implement initState
    super.initState();
  }

  logout(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  // shared pref data clear
  // open  login page
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context)=> loginpage()),
          (route) => false,);
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 100,),
                          GestureDetector(
                            onTap: (){
                              logout(context);
                            },
                            child: const Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Icon(Icons.logout,size: 25,color: Colors.black54,),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
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
                                navigatetodetail(context,newsdata.articles![index]);
                              },
                              child: CardModules.Cards(size,
                                  newsdata.articles![index].title!,
                                  newsdata.articles![index].publishedAt,
                                  newsdata.articles![index].urlToImage==null?StaticValues.defaultimg:newsdata.articles![index].urlToImage!),
                            );
                          },
                        ),
                      ),
                      Container(
                          height: size.height/1.5,
                          width:size.width,
                          child: ListView.builder(
                            itemCount: newsdata.articles!.length,
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index){
                              return GestureDetector(
                                onTap: (){
                                  //navigate to new page
                                  navigatetodetail(context,newsdata.articles![index]);
                                },
                                child: CardModules.Listtile(size,newsdata.articles![index]),
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