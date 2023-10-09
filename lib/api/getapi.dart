
import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newsproject/model/newsdata.dart';
import 'package:newsproject/static.dart';

class GetApi{

  //getting news datas
  Future<NewsData?> getnewsdata() async {
      try {
        String baseurl= "newsapi.org";
        String apikey = "a25a0c0b883c4f389ff5c23da0f9dfea";
        var headerdata= {
            'Content-type':'application/json',
            'Accept':'application/json',
            'Cache-Control':'no-cache,private,no-store,must-revalidate',
        };
       // https://newsapi.org/v2/everything?domains=wsj.com&apiKey=a25a0c0b883c4f389ff5c23da0f9dfea

        var url = Uri.https(baseurl, '/v2/everything',{"domains":"wsj.com", "apiKey":apikey });

        // Await the http get response, then decode the json-formatted response.
        var response = await http.get(url,headers: headerdata);

          var jsonResponse = convert.jsonDecode(response.body);
          var data = NewsData.fromJson(jsonResponse);
          StaticValues.listofarticles = data.articles!;

        return data;
      }catch(e){
        if (kDebugMode) {
          print(e.toString());

        }
        return null;
        //return
      }
  }

  Future<List<NewsData>?> getlistnewsdata() async {
    try {
      String baseurl= "newsapi.org";
      String apikey = "a25a0c0b883c4f389ff5c23da0f9dfea";
      var headerdata= {
        'Content-type':'application/json',
        'Accept':'application/json',
        'Cache-Control':'no-cache,private,no-store,must-revalidate',

      };
      // https://newsapi.org/v2/everything?domains=wsj.com&apiKey=a25a0c0b883c4f389ff5c23da0f9dfea

      var url = Uri.https(baseurl, '/v2/everything',{"domains":"wsj.com", "apiKey":apikey });

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url,headers: headerdata);

      var jsonResponse = convert.jsonDecode(response.body);
      List<NewsData>? ndata=[];
      for(var i in jsonResponse){
        var data = NewsData.fromJson(jsonResponse);
        ndata.add(data);
      }

      return ndata;
    }catch(e){
      if (kDebugMode) {
        print(e.toString());

      }
      return null;
      //return
    }
  }

}