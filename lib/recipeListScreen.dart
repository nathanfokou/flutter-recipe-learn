import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/recipeScreen.dart';
import 'package:flutter_application_1/utilis/recipe.dart';
import 'package:flutter_application_1/utilis/recipeBox.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class RecipeListScreen extends StatefulWidget{


  @override
  State<RecipeListScreen> createState() => RecipeListScreenState( );
}

class RecipeListScreenState extends State<RecipeListScreen> {

  /*final List<Recipe> recipes = [
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
  ];*/


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes recettes",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor:  Colors.red[500],
      ),
      body: ValueListenableBuilder(
          valueListenable: RecipeBox.box!.listenable() ,
          builder: (context, Box items, _) {

            List<String> keys = items.keys.cast<String>().toList();
            return ListView.builder(
                itemCount: keys.length ,
                itemBuilder: (context,index){
                  final recipe =  items.get(keys[index]);
                  return Dismissible(
                      key: Key(recipe.title),
                      onDismissed: (direction){
                        setState(() {
                          RecipeBox.box?.delete(recipe.key());
                          //recipes.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${recipe.title} supprimé")) );
                      },
                      background: Container( color: Colors.red) ,
                      child: RecipeItemWidget(recipe: items.get(keys[index]))
                  );

                }
            );

        }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/newRecipe');
          },
        child: Icon(Icons.add) ,
      ),


      /*body: ListView(
        children: [
          RecipeItemWidget( recipe: Recipe(
              "Pizza facile",
              "Toi et Moi",
              'https://res.cloudinary.com/swissmilk/image/fetch/w_600,c_fill,g_auto,f_auto,q_auto:eco,ar_1:1/https%3A%2F%2Fapi.swissmilk.ch%2Fwp-content%2Fuploads%2F2019%2F06%2Fpesto-pizza-mit-cherrytomaten.jpg',
              "une description un peu longue La pizza est l'un des plats italiens les plus répandus dans le monde. Bien sûr, pizzas, calzone et Cie sont meilleurs en Italie… ou faits maison. Faire sa pizza, c'est facile. La qualité des ingrédients est essentielle, en particulier pour la plus pure des pizzas, la mère de toutes les pizzas pour ainsi dire: la pizza margherita. Une bonne pâte à pizza",
              false,
              50
          )),
          RecipeItemWidget( recipe: Recipe(
              "Burger facile",
              "Pitou de Dadi",
              "https://assets.afcdn.com/recipe/20190206/87301_w1024h768c1cx2213cy1453cxt0cyt0cxb4500cyb3000.jpg",
              "une description un peu longue La pizza est l'un des plats italiens les plus répandus dans le monde. Bien sûr, pizzas, calzone et Cie sont meilleurs en Italie… ou faits maison. Faire sa pizza, c'est facile. La qualité des ingrédients est essentielle, en particulier pour la plus pure des pizzas, la mère de toutes les pizzas pour ainsi dire: la pizza margherita. Une bonne pâte à pizza",
              false,
              50
          )),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text("Burger fait maison"),
          ),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text("Pizza fait maison"),
          )
        ],
      ) ,*/

    );
  }

}

class RecipeItemWidget extends StatelessWidget{

  const RecipeItemWidget ({ Key? key ,required this.recipe}): super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        /*Navigator.push(context, MaterialPageRoute(
            builder: (context) => RecipeScreen(recipe:recipe)
        ));*/
        
        Navigator.pushNamed(context, 'recipe',arguments:recipe );
        /*
        maniere de base de naviger sans les routes
        Navigator.push(context,
           
            PageRouteBuilder(
                pageBuilder: (context,animation,secondaryAnilation)   => RecipeScreen(recipe:recipe),
                transitionsBuilder: (context,animation,secondaryAnilation,child){
                  animation = CurvedAnimation(parent: animation, curve: Curves.ease);
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                }
            )

        );*/
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Hero(
              tag: "imageRecipe" + recipe.title,
              child: CachedNetworkImage(
                imageUrl: recipe.imageUrl,
                placeholder: (context, url ) =>
                  Center(child: CircularProgressIndicator()),
                errorWidget:   (context, url, error ) => Icon(Icons.error) ,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(recipe.title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  Text(recipe.user,
                    style: TextStyle(color: Colors.grey[500], fontSize: 16))
                ],
              ),
            )
          ],
        ),
      ), 
    );
  }
}