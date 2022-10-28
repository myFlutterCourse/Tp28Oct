import 'package:tp_28oct/Owner.dart';

class Dog {
  int id;
  String name;
  double age;
  String gender;
  String color;
  double weight;
  String location;
  String image;
  String about;
  Owner owner;

  //constructor
  Dog(this.id, this.name, this.age, this.gender, this.color, this.weight,
      this.location, this.image, this.about,this.owner);
}
