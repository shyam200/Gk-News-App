//TO Display news Articles
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickie/ViewModels/newsArticleListViewModel.dart';
import 'package:quickie/widgets/newsList.dart';
class NewsListPage extends StatefulWidget {
//   //Accessing the newsArticleListViewMOdel
//   NewsArticleListViewModel _newsArticleListViewModel=NewsArticleListViewModel();
//  // calling constructor and 
//    NewsList(){
//      //calling populateTopHeadlines() whenever this page is created
//      _newsArticleListViewModel.populateTopHeadlines();
//    }
 
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
 //To work with(allow interactions like clearing the textbox etc) textfield we need to define text edit Controller 
  final _controller=TextEditingController();
  //Function to display according according the status
Widget _buildList(NewsArticleListViewModel vm){
   // switch (vm.loadingStatus) {
     if(vm.loadingStatus==LoadingStatus.empty) 
     {
       return Align(child: Text("Results not found!"));
     }
     if(vm.loadingStatus==LoadingStatus.completed)
     {
       //wraping NewsList into Expanded widget because if we not do articles will collapse in the column
        //passing article to articles of newsList constructor
         return  Expanded(child: NewsList(articles: vm.article));
     }
    
}
  @override
  Widget build(BuildContext context) {
  //To use provider notifer here we need to invoke that here To refresh the page again
  final NewsArticleListViewModel vm=Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title:Text('Top News'),
        backgroundColor:Colors.teal //[210]
      ),
       body:
      (vm.loadingStatus== LoadingStatus.searching )? Center(child: CircularProgressIndicator()) :
        
        Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              onSubmitted: (val){
                //calling when user submiited
                if(val.isNotEmpty)
                 {
                   // this.navToInPage(context, val);
                   vm.search(val);
                //  Navigator.of(context).pushNamed("/mainPage");
                
                  //  Navigator.push(context, MaterialPageRoute(
                  //    builder:(context)=>InputScreen(value: val) ));
                
                 }
              }, 
              decoration: InputDecoration(
                labelText: "Enter Keyword To Search",
                icon:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: (){
                   _controller.clear();
                  
                  //  _buildList(vm);
                 // Navigator.of(context).pop();
                 //   Navigator.of(context).pushNamed("mainPage");
                  },
                ),
              ),
            ),
        _buildList(vm),
          ],

        )
          
      
    );
  }
}