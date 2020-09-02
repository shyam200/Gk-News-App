//Each article of particular screen is identified here
//this class represent each row of the screen
import 'package:quickie/models/NewsArticle.dart';

class NewsArticleViewModel{

 NewsArticle _newsArticle;           //  '_' shows private member 
// NewsArticleViewModel({this.newsArticle}) can also like this if newArticle would be public
 NewsArticleViewModel({NewsArticle article}):_newsArticle=article; //using this brcause _newsArticle is private 

String get title{
  return _newsArticle.title;
}
String get description{
  return _newsArticle.description;
}

String get urlToImage{
  return _newsArticle.urlToImage;   //null
}

String get url{
  return _newsArticle.url;
}

}