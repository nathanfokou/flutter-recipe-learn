import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/recipe.dart';
import 'package:flutter_application_1/utilis/recipeBox.dart';

class FavoriteChangeNontifier  with ChangeNotifier {
 /*
  bool _isFavorited;
  final int _favoriteCount;

  FavoriteChangeNontifier(this._isFavorited,this._favoriteCount);

  bool get isFavorited => _isFavorited;

  int get favoriteCount => _favoriteCount + ( _isFavorited ? 1: 0);

  set isFavorited( bool isFavorited){

    _isFavorited = isFavorited;

    notifyListeners();

  }

  */

  Recipe recipe;

  FavoriteChangeNontifier(this.recipe);

  bool get isFavorited =>recipe.isFavorited;

  int get favoriteCount => recipe.favoriteCount + (recipe.isFavorited ? 1: 0);

  set isFavorited( bool isFavorited){

    recipe.isFavorited = isFavorited;
    //RecipeDataBase.instance.updateRecipe(recipe);
    RecipeBox.box?.put(recipe.key(), recipe);

    notifyListeners();

  }
}