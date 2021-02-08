import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:housing/Pages/Setup/alldata.dart';
import 'package:housing/Pages/Setup/welcome.dart';
import 'package:housing/Pages/contact/contact.dart';
import 'package:housing/Pages/maplaunch/launchmap.dart';
import 'package:housing/Pages/sqlite/db_page.dart';
import 'package:housing/Pages/gallery/gallery.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOMEPAGE'),
      ),
      body: Center(
        child: Container( alignment: Alignment.center,
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg.jpg"),
                    fit: BoxFit.cover)
            ),

            child: Table(
              children: [
                TableRow(
                    children: [
                      Container(height: 100, color: Colors.red, child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context) => Alldata()));
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Column(
                              children: [
                                Image.asset('images/icons/house.png', height: 80),
                                Text("Houses List")
                              ],
                            )
                        ),
                      ),),
                      Container(height: 100, color: Colors.blue, child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context) => DBTestPage()));
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Column(
                              children: [
                                Image.asset('images/icons/cars.png', height: 80),
                                Text("Vehicles")
                              ],
                            )
                        ),
                      ),),
                      Container(height: 100, color: Colors.yellow, child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context) => LaunchMap()));
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Column(
                              children: [
                                Image.asset('images/icons/location.png', height: 80),
                                Text("Location")
                              ],
                            )
                        ),
                      ),),
                    ]
                ),
                TableRow(
                    children: [
                      Container(height: 100, color: Colors.green, child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context) => ContactLaunch()));
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Column(
                              children: [
                                Image.asset('images/icons/contact.png', height: 80),
                                Text("Contacts")
                              ],
                            )
                        ),
                      ),),
                      Container(height: 100, color: Colors.orange, child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context) => Gallery()));
                            },
                            padding: EdgeInsets.all(0.0),
                              child: Column(
                              children: [
                                Image.asset('images/icons/camera.png', height: 80),
                                Text("Gallery")
                              ],
                            )
                        ),
                      ),),
                      Container(height: 100, color: Colors.purple, child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => WelcomePage()));
                            },
                            padding: EdgeInsets.all(0.0),
                              child: Column(
                              children: [
                                Image.asset('images/icons/logout.png', height: 80),
                                Text("Log Out")
                              ],
                            )
                        ),
                      ),),
                    ]
                )

              ],
            )
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
