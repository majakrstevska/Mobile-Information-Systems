import 'package:flutter/material.dart';

// 1. Create a model class for psychologists.
class Psychologist {
  String name;
  String surname;
  String contact;
  String area;
  Psychologist(this.name, this.surname, this.contact, this.area);
}