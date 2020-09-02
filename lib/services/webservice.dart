//This is for fetching network result and returning json result and passing the result to NewsArticle 
import 'dart:convert';
import 'package:quickie/utils.dart/constants.dart';
import '../models/NewsArticle.dart';
import 'package:http/http.dart' as http;
import'dart:async';
//import 'NewsArticle.dart';

class Webservices {
//function to fetch the content by keyword//function to fetch topHeadlines
Future<List<NewsArticle>>fetchHeadlinesByKeywork(String keyword) async{
// String url="https://newsapi.org/v2/everything?q=bitcoin&apiKey=fe7e8f0298354b57be71144179ea0f4d";
//passing the url in get from the constants class instead of passing directly
 final response=await http.get(Constants.fetchBy(keyword));
 if(response.statusCode==200){
   final result=jsonDecode(response.body);
   Iterable list=result['articles'];
    return list.map((json) => NewsArticle.fromJSON(json)).toList();
  }
  else
  {
    throw Exception("Result Not Found!");
  } 
}

Future<List<NewsArticle>> fetchTopHeadlines() async {
  //url containing the api key of news
 //getting the url into response variable
// String url= "https://newsapi.org/v2/top-headlines?country=us&apiKey=fe7e8f0298354b57be71144179ea0f4d";
 
 //Passing the url in get from constants class instead of passing directly
   final response= await http.get(Constants.Top_Headlines_Url);
   //checking the response is good or not by status code
   if(response.statusCode==200)
   { //if response is successful then decode the response body
      final result=  jsonDecode(response.body);
      //since result is cotaining everythin we need to get article(Please read dcumentaion in api) array out of it
     //Terable because we're going to itearate through array
      Iterable list=result['articles'];  //articles is going to return an array of dictionary
      //return each article by mapping and passing into NewsArticle 
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
   }
   else{
     //if response is bad this will run
    throw  Exception("Failed to get top News!");
   }
  
}
} 