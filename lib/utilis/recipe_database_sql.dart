import 'package:flutter/material.dart';

class Recipe {
  String title;
  String user;
  String imageUrl;
  String description ;
  bool isFavorited;
  int favoriteCount;

  Recipe(this.title, this.user, this.imageUrl, this.description,
      this.isFavorited, this.favoriteCount);

  Map<String, dynamic> toMap(){
    return{
      'title':title,
      'user':user,
      'imageUrl':imageUrl,
      'description':description,
      'isFavorited':isFavorited,
      'favoriteCount':favoriteCount,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) => new Recipe(
    map['title'],
    map['user'],
    map['imageUrl'],
    map['description'],
    map['isFavorited'] == 1,
    map['favoriteCount'],
  );

}