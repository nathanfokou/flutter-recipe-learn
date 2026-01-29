import 'package:flutter/material.dart';
import 'package:flutter_application_1/recipeListScreen.dart';
import 'package:flutter_application_1/recipeScreen.dart';
import 'package:flutter_application_1/utilis/recipe.dart';
import 'package:flutter_application_1/utilis/recipeBox.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RecipeBox.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: (settingts)=> RouteGnerator.generateRoute(settingts) ,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
     /*home: RecipeListScreen()*/
      /*home:  RecipeScreen( recipe: Recipe(
        'Ce que tu dois manger',
        'Le Nyan Moudang',
        'https://www.afrosmartshop.com/wp-content/uploads/2021/05/Recette_Ndole%CC%80.png',
        "Pour ouvrir un lien dans un nouvel onglet en HTML, utilisez l'attribut\ntarget=_blank dans la balise <a>, par exemple : <a href=url_de_la_page target=_blank>Texte du lien</a> ; cette méthode est simple et courante, mais il est recommandé d'ajouter également rel=noopener noreferrer pour \n"
            " des raisons de sécurité et de performance lorsque le lien pointe vers une source externe, afin d'empêcher le script de la page cible d'accéder à la page d'origine. ",
        false,
        99
      )),*/
    );
  }
}


class RouteGnerator {
  static Route<dynamic> generateRoute (RouteSettings settingts){
    switch(settingts.name){
      case'/':
        return MaterialPageRoute(builder: (context)=> RecipeListScreen());
      case 'recipe':
        return PageRouteBuilder(
            pageBuilder: (context,animation,secondaryAnilation)   => RecipeScreen(recipe: settingts.arguments  as Recipe),
            transitionsBuilder: (context,animation,secondaryAnilation,child){
              animation = CurvedAnimation(parent: animation, curve: Curves.ease);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
        );
      default :
        return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text("Error"), centerTitle: true, ),
              body: Center(
                child: Text("page not found"),
              ),
            )
        );
    }
  }
}









