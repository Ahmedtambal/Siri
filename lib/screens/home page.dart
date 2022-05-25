import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siri/models/auth%20page.dart';
import 'package:siri/screens/login%20screen.dart';





class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;


  String input = "";

  get showRegisterPage => null;

  createSiri(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MySiri").doc(input);
    Map<String , String> si = {
      "siriTitle" : input

    };
    documentReference.set(si).whenComplete((){
      print("$input created");
    });
  }

  deleteSirei(item){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MySiri").doc(item);

    documentReference.delete().whenComplete((){
      print("$item Deleted");
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title :Text('Siri'),
      ),
      drawer: Drawer(
        child: Container(
          decoration:BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Colors.white70,
                    Colors.white,
                  ]
              )
          ) ,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [ Colors.orange,Colors.orangeAccent],
                  ),
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Siri App",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),




              ListTile(
                leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: Colors.black,),
                title: Text('Logout',style: TextStyle(fontSize: _drawerFontSize,color: Colors.black),),
                onTap: () {
                    FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed:(){
          showDialog(context: context, builder: (
          BuildContext context){
            return AlertDialog (
              backgroundColor: Colors.amberAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              title: Text('Add siri'),
              content: TextField(
                onChanged: (String value){
                  input = value;
                },
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed:(){
                        createSiri();
                        Navigator.of(context).pop();
                    },

                      child: Text("Add")
                )

              ],
            );

          }
          );
        },
        child: Icon(
          Icons.add,
              color: Colors.white,
        ),
      ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('MySiri').snapshots(),
            builder: (context, AsyncSnapshot snapshot){

              if(snapshot.data == null) return CircularProgressIndicator();

              return ListView.builder(
                  shrinkWrap: true,
                  itemCount:snapshot.data.docs.length,
                  itemBuilder: (context , int index){
                DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                    return Dismissible(
                      key : Key(index.toString()),
                      child:  Card(
                        elevation: 4,
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                        ),
                        child: ListTile(
                          title: Text(documentSnapshot['siriTitle']),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color:  Colors.red,
                            ), onPressed: () {
                            deleteSirei(documentSnapshot["siriTitle"]);
                          },
                          ),
                        ),
                      ),
                    );
                  });
            }),
    );
  }
}




