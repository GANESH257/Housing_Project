class Vehicle {
  int id;
  String name;
  String color;

  Vehicle(this.id, this.name, this.color);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'color':color,
    };
    return map;
  }

  Vehicle.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    color = map['color'];
  }
}