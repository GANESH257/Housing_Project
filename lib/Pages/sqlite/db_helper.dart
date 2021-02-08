import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'vehicle.dart';

class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String COLOR = 'color';
  static const String TABLE = 'Vehicle';
  static const String DB_NAME = 'vehicle1.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $NAME TEXT, $COLOR)");
  }

  Future<Vehicle> save(Vehicle vehicle) async {
    var dbClient = await db;
    vehicle.id = await dbClient.insert(TABLE, vehicle.toMap());
    return vehicle;
    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + vehicle.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }

  Future<List<Vehicle>> getVehicle() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, NAME, COLOR]);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Vehicle> vehicle = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        vehicle.add(Vehicle.fromMap(maps[i]));
      }
    }
    return vehicle;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> update(Vehicle vehicle) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, vehicle.toMap(),
        where: '$ID = ?', whereArgs: [vehicle.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}