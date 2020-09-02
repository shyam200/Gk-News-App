
//This is the class where we store out all urls safely 
//we're doing this because in future if urls get change then is is easier for us to change it by going to one palce i.e in this calss

class Constants{
  static String Top_Headlines_Url="https://newsapi.org/v2/top-headlines?country=us&apiKey=fe7e8f0298354b57be71144179ea0f4d";

   //Url for searching by keyword
   static String fetchBy(String keyword){
     return "https://newsapi.org/v2/everything?q=$keyword&apiKey=fe7e8f0298354b57be71144179ea0f4d";

   }
}