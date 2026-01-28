import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/recipe.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:provider/provider.dart';
import 'favoriteChangeNontifier.dart';
import 'favoriteWidget.dart';

class RecipeScreen extends StatelessWidget {

  final Recipe recipe;
  const RecipeScreen ({ Key? key ,required this.recipe}): super(key: key);


  // variable global


  @override
  Widget build(BuildContext context) {


    Widget titleSection =  Container(
        padding: const EdgeInsets.all(8),
        child:Row(
          children: [
            Expanded(child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(recipe.title,style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20
                  ),),
                ),
                Text(recipe.user,style: TextStyle(
                    color:Colors.grey[500], fontSize: 16
                ),),
              ],
            )),
            FavoriteIconWidget(),
            FavoriteTextWidget()

          ],
        )
    );

    // variable partielle
    Widget buttonSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _bluildButtonColumn(Colors.blue,Icons.comment,'COMMENT'),
          _bluildButtonColumn(Colors.blue,Icons.share,'SHARE')
        ],
      ) ,
    );

    Widget descriptionSection  =  Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        recipe.description,
        softWrap: true,
      ),
    );

    return ChangeNotifierProvider(
      create: (contexte)=> FavoriteChangeNontifier(recipe),
      child: Scaffold(
          appBar: AppBar(
            title:  Text(recipe.title,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)) ,
            backgroundColor:  Colors.red[500],
      
          ),
          body:ListView(
            children: [
      
              Hero(
                tag: "imageRecipe" + recipe.title,
                child: CachedNetworkImage(
                  imageUrl: recipe.imageUrl,
                  placeholder: (context,url)=> Center(child: CircularProgressIndicator()),
                  errorWidget: (context,url,error)=> Icon(Icons.error),
                  width: 300,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
      
              titleSection,
      
              buttonSection,
      
              descriptionSection,
      
              Stack(
                children: [
                  Container(
                    height: 400,
                    child: Center(child: CircularProgressIndicator(),),
                  ),
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image:  recipe.imageUrl,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ],
      
                // FadeInImage.assetNetwork(
                //     placeholder:  "assets/images/Loading.gif",
                //     image: 'https://www.afrosmartshop.com/wp-content/uploads/2021/05/Recette_Ndole%CC%80.png',
                //     width: 300,
                //     height: 400,
                //     fit: BoxFit.cover,
                // ),
      
                // Image.asset( //assetNetwork :: si l image est en ligne
                //     "assets/images/ndolet.jpg",
                //     width: 300,
                //     height: 400,
                //     fit: BoxFit.cover,
                // ),
      
      
              )
      
      
            ],
          )
      
      
      ),
    );
  }
}


Column _bluildButtonColumn ( Color color, IconData icon , String labal){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.only(bottom: 8),
        child:Icon(icon, color:color),
      ),
      Text(labal,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      )
    ],
  );
}