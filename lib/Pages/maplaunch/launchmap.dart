

import 'package:flutter/material.dart';
import 'package:housing/Pages/maplaunch/maplauncher.dart';
import 'package:housing/getitlocator.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchMap extends StatefulWidget {
  LaunchMap({Key key}) : super(key : key);
  final String title = 'Launch Map';
  @override
  _LaunchMapState createState() => _LaunchMapState();
}

class _LaunchMapState extends State<LaunchMap> {
  Future<void> _launched;
  String _launchMap = 'https://goo.gl/maps/Tsytgpz82YFtxGiw7';


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
                  Text('The Location is currently Set to Wonders Park Mumbai'),
                  Text('Click to Launch'),
                  RaisedButton(
                    child: const Text('Launch in Browser'),
                      onPressed: (){
                      getitlocator.get<MapLauncher>().launchInBrowser(_launchMap);
                      },
                  )
                ],
              ),
            ),
            ),
    );
  }
}
