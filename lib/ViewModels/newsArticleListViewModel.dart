//It is going to describe complete screen where we display all the top head lines
//Each article of particular screen is identified by newArticleViewModel
//this will represent complete screen
import 'package:flutter/material.dart';
import 'package:quickie/ViewModels/newsArticleViewModel.dart';
import 'package:quickie/models/NewsArticle.dart';
import 'package:quickie/services/webservice.dart';

  //creating to describe the current status of the application
  enum LoadingStatus{
    searching,
    completed,
    empty,
  }
//changeNotifier let's know The UI(or whoever is listening) about changes i.e hey we got the article display it and refresh old one
class NewsArticleListViewModel extends ChangeNotifier{
//initially when this class called our app in searching phase i.e data is not fetched yet!
 var loadingStatus=LoadingStatus.searching;
  //creating List of view Model by invoking it into article
  List<NewsArticleViewModel> article= List<NewsArticleViewModel>();

  NewsArticleListViewModel(){
        _populateTopHeadlines();
  }

 Future<void>search(String keyword) async{
  this.loadingStatus=LoadingStatus.searching;
  notifyListeners();
  List<NewsArticle>newsArticles=await Webservices().fetchHeadlinesByKeywork(keyword);
   //to respresent it into Ui
   this.article=newsArticles.map((eachValue) => NewsArticleViewModel(article: eachValue)).toList();
   //setting the loading status
   this.loadingStatus=this.article.isEmpty ? LoadingStatus.empty :LoadingStatus.completed;
   //To notify Ui about changes
   
   notifyListeners();
 }

  Future<void> _populateTopHeadlines()async{
  this.loadingStatus=LoadingStatus.searching;
   List<NewsArticle> newsArticles=await Webservices().fetchTopHeadlines();
   //To represent this newsArticles into we need to convert it into viewModels
   this.article=newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
   this.loadingStatus=this.article.isEmpty ? LoadingStatus.empty :LoadingStatus.completed;
   //whenever we call notifyListeners() the view can listen to this changes and get access to the NewsArticleListViewModel ans all the public properties  
      notifyListeners(); 
  }
}

