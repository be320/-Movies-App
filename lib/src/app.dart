import 'package:flutter/material.dart';
import '../src/models/movie.dart';
import '../src/resources/api.dart';
class App extends StatefulWidget
{
  createState()
  {
    return AppState();
  }
}

class AppState extends State<App>
{
  var movies;
  void getData()async
  {
    var data = await getJson();
    setState(() {
      movies = data['results'];
    });
  }
  Widget build(context)
  {
    getData();
    return MaterialApp(
        home: Scaffold(   
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Now Playing Movies'),
      ),
      body: GridView.count(
        primary: false,
  padding: const EdgeInsets.all(20.0),
mainAxisSpacing: 20.0,
  crossAxisSpacing: 10.0,
  crossAxisCount: 2,
  children: 
   List.generate(movies == null ? 0 : movies.length*2,(index){
    Widget wid; 
    if(index==1)
    {
wid=Center(
              child:  Text(Movie.fromJson(movies[0]).title,style: TextStyle(color: Colors.blue[300],fontSize: 25.0,),textAlign: TextAlign.center,) ,
            );
       return wid; 
    }
    else if(index%2==0)
    {
      wid=Center(
              child: Image.network(Movie.fromJson(movies[(index/2).round()]).poster_path,height: 250,fit: BoxFit.fill,),
            );
    }
    else
    {
    wid=Center(
              child:  Text(Movie.fromJson(movies[((index-1)/2).round()]).title,style: TextStyle(color: Colors.blue[300],fontSize: 25.0,),textAlign: TextAlign.center,) ,
            );
    }
      return wid;        
  })
      ),
    ),
    );
  }
}