import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/recipe.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RecipeDataBase{
  RecipeDataBase._();

  static final RecipeDataBase instance = RecipeDataBase._();
  static Database? _database; // Ajout du ? pour rendre nullable

  Future<Database> get database async {
    if(_database != null) return _database!; // avec le "!" à a fin On "promet" au compilateur que ce n'est pas null
    _database = await initBD();
    return _database!; // On "promet"  qu'il n'est pas null car on vient de l'initialiser
  }


  initBD() async{
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join( await getDatabasesPath(), 'recipe_database.db'),
      onCreate: (db, version){
        return db.execute(
          "CREATE TABLE recipe(title TEXT PRIMARY KEY, user TEXT, imageUrl TEXT, description TEXT, isFavorited INTEGER, favoriteCount INTEGER)"
        );
      },
      version: 1,
    );
  }

  void insertRecipe(Recipe recipe) async {
     final Database db = await database;
     await db.insert(
     'recipe',
     recipe.toMap(),
     conflictAlgorithm: ConflictAlgorithm.replace,
     );
  }

  void updateRecipe(Recipe recipe) async {
    final Database db  =  await database;
    await db.update("recipe",recipe.toMap(),
    where: 'title = ?',whereArgs: [recipe.title]);
  }

  void deleteRecipe(String title) async {
    final Database db  =  await database;
    await db.delete("recipe",where: 'title = ?',whereArgs: [title]);
  }

  Future <List <Recipe>> recipes() async{
    final Database db = await database;
    final List<Map <String, dynamic>> maps = await db.query('recipe');
    List<Recipe> recipes = List.generate(maps.length, (i){
     return Recipe.fromMap(maps[i]);
    });

    if(recipes.isEmpty){
      for ( Recipe recipe in defaultRecipes){
        insertRecipe(recipe);
      }
      recipes = defaultRecipes;
    }

    return recipes;
  }

  final List<Recipe> defaultRecipes = [
    Recipe(
        "Pizza facile",
        "Toi et Moi",
        'https://res.cloudinary.com/swissmilk/image/fetch/w_600,c_fill,g_auto,f_auto,q_auto:eco,ar_1:1/https%3A%2F%2Fapi.swissmilk.ch%2Fwp-content%2Fuploads%2F2019%2F06%2Fpesto-pizza-mit-cherrytomaten.jpg',
        "une description un peu longue La pizza est l'un des plats italiens les plus répandus dans le monde. Bien sûr, pizzas, calzone et Cie sont meilleurs en Italie… ou faits maison. Faire sa pizza, c'est facile. La qualité des ingrédients est essentielle, en particulier pour la plus pure des pizzas, la mère de toutes les pizzas pour ainsi dire: la pizza margherita. Une bonne pâte à pizza",
        false,
        50
    ),
    Recipe(
        "Burger facile",
        "Pitou de Dadi",
        "https://assets.afcdn.com/recipe/20190206/87301_w1024h768c1cx2213cy1453cxt0cyt0cxb4500cyb3000.jpg",
        "une description un peu longue La pizza est l'un des plats italiens les plus répandus dans le monde. Bien sûr, pizzas, calzone et Cie sont meilleurs en Italie… ou faits maison. Faire sa pizza, c'est facile. La qualité des ingrédients est essentielle, en particulier pour la plus pure des pizzas, la mère de toutes les pizzas pour ainsi dire: la pizza margherita. Une bonne pâte à pizza",
        false,
        44
    ),
    Recipe(
        "Crepe à domicile et facile",
        "le Nyan",
        "https://assets.afcdn.com/recipe/20250128/157770_w157h157c1cx1130cy1023cxt0cyt0cxb2667cyb1500.webp",
        "une description un peu longue La pizza est l'un des plats italiens les plus répandus dans le monde. Bien sûr, pizzas, calzone et Cie sont meilleurs en Italie… ou faits maison. Faire sa pizza, c'est facile. La qualité des ingrédients est essentielle, en particulier pour la plus pure des pizzas, la mère de toutes les pizzas pour ainsi dire: la pizza margherita. Une bonne pâte à pizza",
        false,
        25
    ),
    Recipe(
        "Burger facile de fou",
        "Le Moudang",
        "https://assets.afcdn.com/recipe/20190206/87301_w1024h768c1cx2213cy1453cxt0cyt0cxb4500cyb3000.jpg",
        "une description un peu longue La pizza est l'un des plats italiens les plus répandus dans le monde. Bien sûr, pizzas, calzone et Cie sont meilleurs en Italie… ou faits maison. Faire sa pizza, c'est facile. La qualité des ingrédients est essentielle, en particulier pour la plus pure des pizzas, la mère de toutes les pizzas pour ainsi dire: la pizza margherita. Une bonne pâte à pizza",
        false,
        21
    ),
    Recipe(
        "Pizza facile de ouf",
        "Qui suis je",
        'https://res.cloudinary.com/swissmilk/image/fetch/w_600,c_fill,g_auto,f_auto,q_auto:eco,ar_1:1/https%3A%2F%2Fapi.swissmilk.ch%2Fwp-content%2Fuploads%2F2019%2F06%2Fpesto-pizza-mit-cherrytomaten.jpg',
        "une description un peu longue La pizza est l'un des plats italiens les plus répandus dans le monde. Bien sûr, pizzas, calzone et Cie sont meilleurs en Italie… ou faits maison. Faire sa pizza, c'est facile. La qualité des ingrédients est essentielle, en particulier pour la plus pure des pizzas, la mère de toutes les pizzas pour ainsi dire: la pizza margherita. Une bonne pâte à pizza",
        false,
        35
    ),
    Recipe(
        "Burger facile maison",
        "Eden ",
        "https://assets.afcdn.com/recipe/20190206/87301_w1024h768c1cx2213cy1453cxt0cyt0cxb4500cyb3000.jpg",
        "une description un peu longue La pizza est l'un des plats italiens les plus répandus dans le monde. Bien sûr, pizzas, calzone et Cie sont meilleurs en Italie… ou faits maison. Faire sa pizza, c'est facile. La qualité des ingrédients est essentielle, en particulier pour la plus pure des pizzas, la mère de toutes les pizzas pour ainsi dire: la pizza margherita. Une bonne pâte à pizza",
        false,
        48
    ),
    Recipe(
        "Crepe à domicile",
        "le Nyan",
        "https://assets.afcdn.com/recipe/20250128/157770_w157h157c1cx1130cy1023cxt0cyt0cxb2667cyb1500.webp",
        "une description un peu longue La pizza est l'un des plats italiens les plus répandus dans le monde. Bien sûr, pizzas, calzone et Cie sont meilleurs en Italie… ou faits maison. Faire sa pizza, c'est facile. La qualité des ingrédients est essentielle, en particulier pour la plus pure des pizzas, la mère de toutes les pizzas pour ainsi dire: la pizza margherita. Une bonne pâte à pizza",
        false,
        25
    ),
    Recipe(
        "Burger à domicile",
        "Le Moudang",
        "https://assets.afcdn.com/recipe/20190206/87301_w1024h768c1cx2213cy1453cxt0cyt0cxb4500cyb3000.jpg",
        "une description un peu longue La pizza est l'un des plats italiens les plus répandus dans le monde. Bien sûr, pizzas, calzone et Cie sont meilleurs en Italie… ou faits maison. Faire sa pizza, c'est facile. La qualité des ingrédients est essentielle, en particulier pour la plus pure des pizzas, la mère de toutes les pizzas pour ainsi dire: la pizza margherita. Une bonne pâte à pizza",
        false,
        21
    ),
    Recipe(
        "Pizza à la piol",
        "Qui suis je",
        'https://res.cloudinary.com/swissmilk/image/fetch/w_600,c_fill,g_auto,f_auto,q_auto:eco,ar_1:1/https%3A%2F%2Fapi.swissmilk.ch%2Fwp-content%2Fuploads%2F2019%2F06%2Fpesto-pizza-mit-cherrytomaten.jpg',
        "une description un peu longue La pizza est l'un des plats italiens les plus répandus dans le monde. Bien sûr, pizzas, calzone et Cie sont meilleurs en Italie… ou faits maison. Faire sa pizza, c'est facile. La qualité des ingrédients est essentielle, en particulier pour la plus pure des pizzas, la mère de toutes les pizzas pour ainsi dire: la pizza margherita. Une bonne pâte à pizza",
        false,
        35
    )
  ];


}