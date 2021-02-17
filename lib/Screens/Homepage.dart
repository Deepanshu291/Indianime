import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'record.dart';
import 'movie_details_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';



class DelayedList extends StatefulWidget {
  String uid;
  DelayedList({this.uid});
  @override
  _DelayedListState createState() => _DelayedListState();
}

class _DelayedListState extends State<DelayedList> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Timer timer = Timer(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });

    return MyHomePage(isl: isLoading,);
  }
}




class MyHomePage extends StatefulWidget {
 bool isl ;
 MyHomePage({this.isl,Key key});
 
 @override
 _MyHomePageState createState() {
   return _MyHomePageState();
 }
}

class _MyHomePageState extends State<MyHomePage> {
  bool search = false;
  List<DocumentSnapshot> update;
 Future<bool> _onback (){
   return showDialog(
     context: context,
     builder: (context) => AlertDialog(
       title: Text("Do you really want to exit "),
       actions: <Widget>[
         FlatButton(onPressed: ()=>Navigator.pop(context, true),
          child: Text("Yes")
          ),
          FlatButton(onPressed: ()=> Navigator.pop(context, false),
          child: Text("No")
          )
       ],
     )
   );
 }


 @override
 Widget build(BuildContext context) {
   return WillPopScope(
     onWillPop: _onback,
        child: Scaffold(
       appBar: AppBar(/*
         title: Text('Indianime'),
       actions: <Widget>[
         IconButton(
           icon: Icon(Icons.search),
          onPressed: (){
             showSearch(context: null, delegate: null);
          }
          )
       ],
       */
      bottom: search ?
      PreferredSize(
         preferredSize: Size.fromHeight(48.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0, bottom: 6.0),
                  decoration: BoxDecoration(
      
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(29.0),
                  ),
                  child: TextFormField(
                    onChanged: (val){
                      return iSearch(val);
                    },
                    
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                    ),
                  //  controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Search Anime...",
                      
                      contentPadding: const EdgeInsets.only(left:14.0),
                      border: InputBorder.none,
                    ),
                  ),
                  
                ),
              ),
              
              IconButton(
                onPressed: (){
                  name="";
                  search = false;
                },
                icon:name==""
                ?
                 Icon(
                  Icons.search,
                  color: Colors.white,
                ):Icon(
                  Icons.cancel,
                  color: Colors.white,
                )
                
                
              )
            ],
          ),
        )
      :null,
     
      backgroundColor:Colors.red,
      //leading: Image(image: AssetImage("fire.png"),),
      title: //!search?
              Text("Indianime",
              style: TextStyle(
                color: Colors.white
              ),
              
              ),
             actions: <Widget>[
               search ?
               name != ""?
              IconButton(icon: Icon(Icons.search,
               color: Colors.white,
               ), onPressed: (){
                 name = "";
               })
               :IconButton(icon: Icon(Icons.cancel,
               color: Colors.white,
               ), onPressed: (){
                 search = false;
                 name = "";
               })
              :
              IconButton(icon: Icon(Icons.search,
               color: Colors.white,
               ), onPressed: (){
                 search = true;
               })
             ],
              /*
              :TextField(
                  onChanged: (val) => initiateSearch(val),
               style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      //fillColor: Colors.white,
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: "Search....",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
               actions: <Widget>[
            search
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        this.search = false;
                       // filteredCountries = countries;
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        this.search = true;
                      });
                    },
                  )
          ],
          */
       ),
       
       body: widget.isl?
              Center(
                child: CircularProgressIndicator(),
              )
              :
        _buildBody(context),
       
     ),
   );
 }


String name ="";

 


 fire(String query){
  return Firestore.instance.collection('movies') .where("name" ,isEqualTo: "your".toLowerCase().contains("your".toLowerCase())  ).snapshots();
}

Widget _buildBody(BuildContext context) {
 return StreamBuilder<QuerySnapshot>(
   stream: name != "" && name != null //&& search != false
              ? Firestore.instance
                  .collection('movies')
                  .where("namesearch",arrayContains: name)
                  
                  .snapshots()
              : Firestore.instance.collection("movies").orderBy("id", descending: true).snapshots(),
   builder: (context, snapshot) {
     if (!snapshot.hasData) return LinearProgressIndicator();

     return _buildList(context, snapshot.data.documents);
   },
 );
}

 
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
   return
      GridView.count(
        childAspectRatio: 4 / 5,
        crossAxisCount: 2,
        padding: const EdgeInsets.only(top: 20.0),
         children: snapshot.map((data) => _buildListItem(context, data)
        
         ).toList(),
         
    
   );
 }

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
 final record = Record.fromSnapshot(data);
 
   return Padding(
     key: ValueKey(record.id),
     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
     child: Container(
        height:  MediaQuery.of(context).size.height*90/100,
         decoration: BoxDecoration(
           border: Border.all(color: Colors.grey),
           borderRadius: BorderRadius.circular(5.0),
         ),
         child: 
          GridTile(
           
           child: Hero(
             tag: record.id,
                        child: InkWell(
                          child:
                           Container(
                            height: 400,  
                            
                            decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                        //fit: BoxFit.cover,
                          fit: BoxFit.fill,
                          image: NetworkImage(record.imageurl),
                      ),
                     
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                        record.name.toUpperCase(),
                         style: TextStyle(
                          fontSize: 16,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                         backgroundColor: Colors.black87
                ),
                textAlign: TextAlign.center,
              ),
                      ],
                    ),
                          
               ),
              
               onTap: (){
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => Detailview(user: record,)));
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ChewieDemo(videoUrl: record,) ));
                   Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(detail: record,)));
               },
             ),
           )
          
           )
         
       
     ),
   );
 }

void iSearch(String val) {
    setState(() {
      name = val.toLowerCase().trim();
    });
  }

}
class Detailview extends StatelessWidget {
  final Record user;
  Detailview({this.user, Key key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name) ,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              user.imageurl
            ),
            Text(
              user.video
            )
          ],
        ),
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;

    return SafeArea(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          offset += 5;
          time = 800 + offset;

          print(time);

          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey[300],
                child: ShimmerLayout(),
                period: Duration(milliseconds: time),
              ));
        },
      ),
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerWidth = 280;
    double containerHeight = 15;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth * 0.75,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}
