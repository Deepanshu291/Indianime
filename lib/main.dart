
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fr/Screens/Homepage.dart';



void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
   
   final routes = <String, WidgetBuilder>{
    LoginPage.route: (BuildContext context) => LoginPage(),
    //HomePage.route: (BuildContext context) => Ref(),
  };

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Baby Names',
      home: LoginPage(),
   // home: //Ref(user: ),
    // routes: routes,
     debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.red),
   darkTheme: ThemeData.dark(),
  // theme: ThemeData.dark(),
   );
 }
}

class LoginPage extends StatefulWidget {
static final String route = "login-page";
@override
LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInAnon() async {
      AuthResult result = await firebaseAuth.signInAnonymously();
      FirebaseUser user = result.user;
      print("Signed in: ${user.uid}");
      return user;
  }
  void signOut() {
      firebaseAuth.signOut();
      print('Signed Out!');
  }

@override
Widget build(BuildContext context) {
  final loginbutton = Container(
    padding: EdgeInsets.all(10.0),
    child: Material(
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.deepOrange,
      elevation: 10.0,
      child: MaterialButton(
        minWidth: 150.0,
        height: 50.0,
        color: Colors.orange,
        child: Text('Login as Guest'),
        onPressed: () {
          signInAnon().then((FirebaseUser user) {
            Navigator
                .of(context)
                .push(MaterialPageRoute(
                    builder: (BuildContext context) => Ref(
                          user: user,
                        )))
                .catchError((e) => print(e));
          });
        },
      ),
    ),
  );

  final logoutButton = Container(
    padding: EdgeInsets.all(10.0),
    child: FlatButton(
      color: Colors.white,
      onPressed: () {
        signOut();
      },
      child: Text(
        "Sign Out",
        style: TextStyle(color: Colors.black),
      ),
    ),
  );

  return Scaffold(
    appBar: AppBar(
      title: Text("Login Page"),
    ),
    body: Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          loginbutton,
          logoutButton,
        ],
      ),
    ),
  );
}
}


class Ref extends StatefulWidget {
 final FirebaseUser user;

  Ref({this.user,Key key});
 
  @override
  _RefState createState() => _RefState();
}

class _RefState extends State<Ref> {
  
  var refreshkey = GlobalKey<RefreshIndicatorState>();
 
 Future<Null> refresh() async{
   // refreshkey.currentState?.show(atTop: false);
   await Future.delayed(Duration(seconds: 2));
 
  
  return null;

 }
 
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: DelayedList(),
     onRefresh: refresh,
     key: refreshkey,
     );
  }
}



