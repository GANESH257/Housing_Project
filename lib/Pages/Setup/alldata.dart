import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:housing/Pages/Home.dart';

class Alldata extends StatefulWidget {
  @override
  _AlldataState createState() => _AlldataState();
}

class _AlldataState extends State<Alldata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()))
        ),
        title: Text('Address Data'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("address").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Text('No value');
          }
          return ListView(
            children: snapshot.data.docs.map((document){
              return new ListTile(
                title: Text(document['House Name']),
                subtitle: Text(document['Owner Name']),
              );
            }).toList(),
          );
      },
      ),
    );
}
}
