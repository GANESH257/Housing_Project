

import 'details_page.dart';
import 'package:flutter/material.dart';
List<ImageDetails> _images = [
  ImageDetails(imagePath: 'images/gallery/gate.jpg', imagePlace: 'Main Gate'),
  ImageDetails(imagePath: 'images/gallery/door.jpg', imagePlace: 'Entrance Door'),
  ImageDetails(imagePath: 'images/gallery/room.jpg', imagePlace: 'Bed Room'),
  ImageDetails(imagePath: 'images/gallery/pool.jpg', imagePlace: 'Swimming Pool'),
  ImageDetails(imagePath: 'images/gallery/pool2.jpg', imagePlace: 'Swimming Pool'),
  ImageDetails(imagePath: 'images/gallery/tv.jpg', imagePlace: 'TV setup'),
  ImageDetails(imagePath: 'images/gallery/kitchen.jpg', imagePlace: 'Kitchen'),
  ImageDetails(imagePath: 'images/gallery/parking.jpeg', imagePlace: 'Car Parking'),
  ImageDetails(imagePath: 'images/gallery/park.jpg', imagePlace: 'The Park'),
  ImageDetails(imagePath: 'images/gallery/coffee.jpg', imagePlace: 'Coffee Shop'),
  ImageDetails(imagePath: 'images/gallery/swing.jpg', imagePlace: 'Kids Play Area'),
  ImageDetails(imagePath: 'images/gallery/turf.jpg', imagePlace: 'The Football Turf')
];

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Text('Gallery', style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),
            textAlign: TextAlign.center),
            SizedBox(
              height: 40.0,
            ),Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                  ),
                  child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ), itemBuilder: (context, index) {
                    return RawMaterialButton(onPressed: () {
                      Navigator.push(context,MaterialPageRoute(
                          builder: (context) => DetailsPage(
                              imagePath : _images[index].imagePath,
                              imagePlace: _images[index].imagePlace
                          )
                      ),
                      );
                   },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(_images[index].imagePath),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    );
                  },
                    itemCount: _images.length,
                  ),
                )
            ),
            Container(
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: EdgeInsets.symmetric(vertical: 15),
                color: Colors.lightBlueAccent,
                child: Text('Back',style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class ImageDetails{
  final String imagePath;
  final String imagePlace;

  ImageDetails({@required this.imagePath,@required this.imagePlace});

}
