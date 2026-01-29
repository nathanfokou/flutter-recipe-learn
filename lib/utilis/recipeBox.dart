

import 'package:flutter_application_1/utilis/recipe.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class RecipeBox{
  static final RecipeBox instance = RecipeBox();
  static Box? box;

  static Future<void> init() async{
    final dir  = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(RecipeAdapter());
    box = await Hive.openBox("recipeBox");

    // Vérifier que box n'est pas null avant d'accéder à values
    if (box != null) {
      var values = box!.values.toList();
      if (values.isEmpty) {
        for (var recipe in recipes) {
          await box!.put(recipe.key(), recipe);
        }
      }
    } else {
      throw Exception("Failed to open Hive box");
    }
  }

  static final List<Recipe> recipes = [
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