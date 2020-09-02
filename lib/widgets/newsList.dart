//This class is to display the data on UI (front page)
import 'package:flutter/material.dart';
import 'package:quickie/ViewModels/newsArticleViewModel.dart';
import '../pages/newsArticleDetailsPage.dart';
class NewsList extends StatelessWidget{
//defining articles
final List<NewsArticleViewModel>articles;
//passing array of articles (which is from NewsListPage)
NewsList({this.articles});

void _newsArticleDetails(BuildContext context ,  NewsArticleViewModel article){

  Navigator.push(context, MaterialPageRoute(
    builder: (context) =>
        NewsArticleDetailsPage(article:article),
     ));
}

  @override
  Widget build(BuildContext context) {

    return  ListView.builder(
        itemCount:articles.length,
        itemBuilder: (context, index){
          final article= articles[index];  //storing the particular index value
         return  ListTile(
           onTap: (){
             _newsArticleDetails(context,article);
           },
           //container to display image in leading
           leading:Container(
             width: 100,
             height: 300,
             padding: EdgeInsets.all(1.0),
             child: article.urlToImage == null ? Image.asset("images/news-placeholder.jpg"): Image.network(article.urlToImage)
          ),
        //here we display title of the news
           title: Text(article.title),
          );
        }  
     );
  }
}