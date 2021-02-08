import 'package:flutter/material.dart';
import 'package:housing/Pages/contact/phonecall.dart';
import 'package:housing/Pages/maplaunch/maplauncher.dart';
import 'package:housing/getitlocator.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactLaunch extends StatefulWidget {
  ContactLaunch({Key key}) : super(key : key);
  final String title = 'Launch Map';
  @override
  _ContactLaunchState createState() => _ContactLaunchState();
}

class _ContactLaunchState extends State<ContactLaunch> {
  String _phone = 'tel:9999999999';
  String _phonehospital = 'tel:8888888888';
  String _phonepolice = 'tel:77777777777';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 60,),
              Text('Apartment Address', style: TextStyle(fontSize: 15, color: Colors.green)),
              Text('ABC Apartments', style: TextStyle(color: Colors.blueAccent, fontSize: 25)),
              Text('Mumbai 309', style: TextStyle(fontSize: 10)),
              Text('Opposite Wonder Mall', style: TextStyle(fontSize: 10)),
              Text('Mumbai West', style: TextStyle(fontSize: 10)),
              RaisedButton(
                child: const Text('Make a Call'),
                onPressed: (){
                  getitlocator.get<PhoneCall>().makePhoneCall(_phone);
                },
              ),
              SizedBox(height: 25),
              Text('Nearest Hospital', style: TextStyle(fontSize: 15, color: Colors.green)),
              Text('XYZ Hospital', style: TextStyle(color: Colors.blueAccent, fontSize: 25)),
              Text('Mumbai 319', style: TextStyle(fontSize: 10)),
              Text('Near Gandhi Park', style: TextStyle(fontSize: 10)),
              Text('Mumbai West', style: TextStyle(fontSize: 10)),
              RaisedButton(
                child: const Text('Make a Call'),
                onPressed: (){
                  getitlocator.get<PhoneCall>().makePhoneCall(_phonehospital);
                },
              ),
              SizedBox(height: 25),
              Text('Nearest Police Station', style: TextStyle(fontSize: 15, color: Colors.green)),
              Text('West Mumbai Police Station', style: TextStyle(color: Colors.blueAccent, fontSize: 25)),
              Text('Mumbai 248', style: TextStyle(fontSize: 10)),
              Text('Indira Nagar', style: TextStyle(fontSize: 10)),
              Text('Mumbai West', style: TextStyle(fontSize: 10)),
              RaisedButton(
                child: const Text('Make a Call'),
                onPressed: (){
                  getitlocator.get<PhoneCall>().makePhoneCall(_phonepolice);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
