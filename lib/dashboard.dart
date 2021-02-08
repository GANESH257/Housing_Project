


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:housing/Pages/Home.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController hnum = new TextEditingController();
  TextEditingController hname = new TextEditingController();
  TextEditingController owner = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Address Dashboard'),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: hnum,
                decoration: InputDecoration(
                  hintText: "Enter House Number"
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: hname,
                decoration: InputDecoration(
                    hintText: "Enter House Name"
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: owner,
                decoration: InputDecoration(
                    hintText: "Enter Owner Name"
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                onPressed: (){
                  Map<String, dynamic> data = {"House Number": hnum.text,"House Name": hname.text,"Owner Name": owner.text};
                  FirebaseFirestore.instance.collection("address").add(data);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));

                },
              child: Text('Submit'),
                color: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
