import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
//model files
import 'package:http_post_req/ui/model.dart';
import 'package:http_post_req/ui/model_categories.dart';
import 'package:http_post_req/ui/model_posts_of_categories.dart';

//
import 'package:path_provider/path_provider.dart';
import 'package:youtube_player/youtube_player.dart';
//class files
import 'package:http_post_req/class/class_post.dart';
import 'package:http_post_req/class/class_categories.dart';
import 'package:http_post_req/class/class_posts_of_categories.dart';
import 'package:http_post_req/class/class_cryptography.dart';
import 'package:http_post_req/class/class_logs.dart';
//


List<dynamic> array_cats_id;
List<dynamic> array_posts_of_cats_id;
var data_strucute1 = [160,161,162,163,164,165,166,167];
var operating_system =[316,317,318,319,320,321,322,323];
void main() async
{

//categories post ids in a file

var urlCatsposts = new class_posts_of_categories ();
await urlCatsposts.getjson_posts_of_categories();
String data_cats_posts = await urlCatsposts.readData_posts_of_categories();
if(data_cats_posts != null)
{
  String message1 = await urlCatsposts.readData_posts_of_categories();
}
array_posts_of_cats_id = json.decode(data_cats_posts);
print(array_posts_of_cats_id);




//categories ids in a file
  var urlCats = new class_categories ();
  await urlCats.getjson_categories();
  String data_cats = await urlCats.readData_categories();
  if(data_cats != null)
  {
    String message1 = await urlCats.readData_categories();
  }
  array_cats_id = json.decode(data_cats);
  print(array_cats_id);







  runApp(MaterialApp(
    home: home(),
  ));
}



class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {




  var post_url = new class_post();
  var categories_url = new class_categories();
  var cryptography_obj = new class_cryptography();
  var logs = new class_logs();



  int i=0;
  void changePath(List array_cats)async
  {
    cryptography_obj.writeData_category_post(array_cats.toString());
    String data_cats = await cryptography_obj.readData_category_post();
    setState(()  {
      array_posts_of_cats_id = json.decode(data_cats);
      print(array_posts_of_cats_id);
    });

  }
  void increment_video_id(){
  if(i<array_posts_of_cats_id.length){
  setState(() {
      i = i+1;
  }
  );}
  else{
    Text('nothing found');
  }
}
  void decrement_video_id(){
    if(i>0){
      setState(() {
        i = i-1;
      }

      );}
    else{
      Text('nothing found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange, title: Text("Learnbywatch", style: TextStyle(color: Colors.white,fontSize: 20.0),), ),


      body: ListView(
        children: <Widget>[
          FutureBuilder<Welcome>(
              future:post_url.getjson('http://eduapp.ml/wp-json/wp/v2/posts/${array_posts_of_cats_id[i]}'),
              builder: (context , snapshot){
                if(snapshot.hasData ) {
                  return Column(
                    children: <Widget>[

                      YoutubePlayer(source: "${snapshot.data
                          .metadata['ocean_post_oembed'][0]}",
                          context: context,
                          quality: YoutubeQuality.LOW,
                      ),

                      Container(
                        padding: EdgeInsets.all(12.0),
                        child: Text('${snapshot.data.slug}',
                          style: TextStyle(fontSize: 20.0),),
                      ),


                      Container(
                        padding: EdgeInsets.only(left: 120.0), child: Row(

                        children: <Widget>[
                          IconButton(icon: Icon(Icons.indeterminate_check_box),
                              onPressed: decrement_video_id),


                          IconButton(icon: Icon(Icons.add_box),
                              onPressed: increment_video_id),


                        ],
                      ),)


                    ],
                  );
                }
                else{

                  return Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(120.0),),
                      CircularProgressIndicator()
                    ],

                  );
                }

              }),

        ],
      ),


      drawer: Drawer(
         child: FutureBuilder <List<Categories>>(
        future: categories_url.getjson_categories(),
             builder:(context,snapshot){
              return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (BuildContext context,int pos){

                return Column(
                  children: <Widget>[
                    Divider(height:15.0),
                    ListTile(title: Text('${snapshot.data[pos].name}'),onTap: (){
                       var category_name = snapshot.data[pos].name;
                       switch (category_name)
                       {

                         case "Data Structure": changePath(data_strucute1);break;
                         case "Operating System": changePath(operating_system);break;

                       }
                    },)
                  ],
                );
              });
             } ),
       )

    );
  }
}



















