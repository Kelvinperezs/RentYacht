import 'package:firebase_database/firebase_database.dart';


class Product {
  int _id;
  String _name;
  String _specs;
  String _week;
  String _mainImage;
  String _description;
  String _day;
  String _altImage1;
  String _altImage2;
  String _altImage3;
  String _altImage4;
  String _altImage5;
  String _altImage6;
  String _altImage7;
  String _altImage8;
  String _altImage9;
  String _half;
  String _specs2;
  String _features;
  String _localizacion;

  Product(this._id, this._name, this._specs, this._week, this._mainImage,
      this._description,
      this._day, this._altImage1, this._altImage2, this._altImage3,
      this._altImage4, this._altImage5,
      this._altImage6, this._altImage7, this._altImage8, this._altImage9, this._half, this._specs2, this._features,
      this._localizacion);

  Product.map(dynamic obj){
    this._id = obj['id'];
    this._name = obj['NAME'];
    this._specs = obj['SPECS'];
    this._week = obj['WEEK'];
    this._mainImage = obj['MAIN IMAGE'];
    this._description = obj['DESCRIPTION'];
    this._day = obj['DAY'];
    this._altImage1 = obj['ALT IMAGE 1'];
    this._altImage2 = obj['ALT IMAGE 2'];
    this._altImage3 = obj['ALT IMAGE 3'];
    this._altImage4 = obj['ALT IMAGE 4'];
    this._altImage5 = obj['ALT IMAGE 5'];
    this._altImage6 = obj['ALT IMAGE 6'];
    this._altImage7 = obj['ALT IMAGE 7'];
    this._altImage8 = obj['ALT IMAGE 8'];
    this._altImage9 = obj['ALT IMAGE 9'];
    this._half = obj['HALF DAY'];
    this._specs2 = obj['SPECS2'];
    this._features = obj['FEATURES'];
    this._localizacion = obj['LOCALIZACION'];
  }

  int get id => _id;

  String get name => _name;

  String get specs => _specs;

  String get week => _week;

  String get mainImage => _mainImage;

  String get description => _description;

  String get day => _day;

  String get altImage1 => _altImage1;

  String get altImage2 => _altImage2;

  String get altImage3 => _altImage3;

  String get altImage4 => _altImage4;

  String get altImage5 => _altImage5;

  String get altImage6 => _altImage6;

  String get altImage7 => _altImage7;

  String get altImage8 => _altImage8;

  String get altImage9 => _altImage9;

  String get half => _half;

  String get specs2 => _specs2;

  String get features => _features;

  String get localizacion => _localizacion;

  Product.fromSnapShot(DataSnapshot snapshot, ){
    _id = snapshot.value['id'];
    _name = snapshot.value['NAME'];
    _specs = snapshot.value['SPECS'];
    _week = snapshot.value['WEEK'];
    _mainImage = snapshot.value['MAIN IMAGE'];
    _description = snapshot.value['DESCRIPTION'];
    _day = snapshot.value['DAY'];
    _altImage1 = snapshot.value['ALT IMAGE 1'];
    _altImage2 = snapshot.value['ALT IMAGE 2'];
    _altImage3 = snapshot.value['ALT IMAGE 3'];
    _altImage4 = snapshot.value['ALT IMAGE 4'];
    _altImage5 = snapshot.value['ALT IMAGE 5'];
    _altImage6 = snapshot.value['ALT IMAGE 6'];
    _altImage7 = snapshot.value['ALT IMAGE 7'];
    _altImage8 = snapshot.value['ALT IMAGE 8'];
    _altImage9 = snapshot.value['ALT IMAGE 9'];
    _half = snapshot.value['HALF DAY'];
    _specs2 = snapshot.value['SPECS2'];
    _features = snapshot.value['FEATURES'];
    _localizacion = snapshot.value['LOCALIZACION'];
  }
}




