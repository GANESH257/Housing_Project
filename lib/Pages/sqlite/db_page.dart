import 'package:flutter/material.dart';
import 'vehicle.dart';
import 'dart:async';
import 'db_helper.dart';

class DBTestPage extends StatefulWidget {
  final String title;

  DBTestPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DBTestPageState();
  }
}

class _DBTestPageState extends State<DBTestPage> {
  //
  Future<List<Vehicle>> vehicle;
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  String name;
  String color;
  int curUserId;

  final formKey = new GlobalKey<FormState>();
  var dbHelper;
  bool isUpdating;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    isUpdating = false;
    refreshList();
  }

  refreshList() {
    setState(() {
      vehicle = dbHelper.getVehicle();
    });
  }

  clearName() {
    controller.text = '';
  }
  clearColor() {
    controller2.text = '';
  }

  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      if (isUpdating) {
        Vehicle e = Vehicle(curUserId, name, color);
        dbHelper.update(e);
        setState(() {
          isUpdating = false;
        });
      } else {
        Vehicle e = Vehicle(null, name, color);
        dbHelper.save(e);
      }
      clearName();
      clearColor();
      refreshList();
    }
  }

  form() {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (val) => val.length == 0 ? 'Enter Name' : null,
              onSaved: (val) => name = val,
            ),
            TextFormField(
              controller: controller2,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Color'),
              validator: (val) => val.length == 0 ? 'Enter Color' : null,
              onSaved: (val) => color = val,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: validate,
                  child: Text(isUpdating ? 'UPDATE' : 'ADD'),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      isUpdating = false;
                    });
                    clearName();
                    clearColor();
                  },
                  child: Text('CANCEL'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView dataTable(List<Vehicle> vehicle) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('NAME'),
          ),
          DataColumn(
            label: Text('COLOR'),
          ),
          DataColumn(
            label: Text('DELETE'),
          )
        ],
        rows: vehicle
            .map(
              (vehicle) => DataRow(cells: [
            DataCell(
              Text(vehicle.name),
              onTap: () {
                setState(() {
                  isUpdating = true;
                  curUserId = vehicle.id;
                });
                controller.text = vehicle.name;
                controller2.text = vehicle.color;

              },
            ),
                DataCell(
                  Text(vehicle.color),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curUserId = vehicle.id;
                    });
                    controller.text = vehicle.name;
                    controller2.text = vehicle.color;

                  },
                ),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                dbHelper.delete(vehicle.id);
                refreshList();
              },
            )),
          ]),
        )
            .toList(),
      ),
    );
  }

  list() {
    return Expanded(
      child: FutureBuilder(
        future: vehicle,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(snapshot.data);
          }

          if (null == snapshot.data || snapshot.data.length == 0) {
            return Text("No Data Found");
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter SQLITE CRUD DEMO'),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            form(),
            list(),
          ],
        ),
      ),
    );
  }
}