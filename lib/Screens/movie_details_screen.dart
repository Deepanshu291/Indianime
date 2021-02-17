import 'package:flutter/material.dart';
import 'record.dart';
import 'video.dart';
import 'package:fr/main.dart';



class MovieDetailsScreen extends StatelessWidget {
  final Record detail;
  MovieDetailsScreen({this.detail,Key key});
 // static const routeName = '/movie-details';
 // final  int  index;
 // HorizontalListItem(this.index);
 /*
 Future gts(BuildContext context, String title,final video) async{
   Map result = await  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext ) => //Scr1(title: title,video: video,)
   ChewieDemo(title: title,videoUrl: video,)
  //Webdemo(title: title, videoUrl: video,) 
  ));

 }
 */
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
         title: Text(detail.name,
         style: TextStyle(
           color: Colors.black87,
         ),
         ),
        backgroundColor: Color(0xfff4f4f4),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.red //Theme.of(context).primaryColor
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: Card(
                elevation: 5,
                child: Hero(
                  tag: detail.id,
                  child: Container(
                    height: 450,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          detail.imageurl,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              detail.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                          size: 45,
                          color: Colors.red ,//Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                           detail.duration,
                        //"",
                          style: TextStyle(
                            
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          size: 45,
                          color: Colors.red ,//Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          detail.year,
                         //"",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          size: 45,
                          color: Colors.red ,//Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                         detail.rating+"/10",
                         //"10",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              detail.description,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                height: 1.5,
              ),
              //textAlign: TextAlign.center,
            ),
/*
            Text(
            
             detail.description,
            // "",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            )
            */
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red ,
       // foregroundColor: Colors. ,
        onPressed: (){
        //  print(movieList[])
        //debugPrint(video);
         Navigator.push(context, MaterialPageRoute(builder: (context) => ChewieDemo(videoUrl: detail)
         //Detailview(user: detail,)
         ));
        },
        tooltip: 'new screen',
        child: Icon(Icons.play_arrow,
        
        ),
      
      ),
/*
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.play_circle_outline,
                  ),
                  Text(
                    'Watch Trailer',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              onPressed: () {},
              color: Colors.yellowAccent,
              textColor: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.check_circle_outline,
                  ),
                  Container(
                    height: 5,
                    width: 5,
                  ),
                  Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),*/
    );
  }
}
/*
void gts(BuildContext context){
  GestureDetector(
    onTap: (){/*
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
    //print("This is working");
    return Scr1();
  }));*/
  Navigator.pushNamed(context ,MaterialPageRoute(builder: (BuildContext ){
     return Scr1();
  }));
  
  print("this is working");
}
  );
}
*/

