//defining models that we're going to use in the App

class NewsArticle{
 final String title;
 final String description;
 final String url;
 final String urlToImage;
 

//Passing data
 NewsArticle({this.title,this.description,this.url, this.urlToImage,});

//function that take dictionay(because data at api is in form of dictionary) and return NewsArtical object
 factory NewsArticle.fromJSON( Map<String, dynamic>json) {
   return NewsArticle(
   
     title:json['title'], 
     description:json['description'],
     url:json['url'], 
     urlToImage:json['urlToImage'],
     );
 }
}