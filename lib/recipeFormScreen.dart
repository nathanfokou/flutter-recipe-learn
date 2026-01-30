import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/recipe.dart';
import 'package:flutter_application_1/utilis/recipeBox.dart';

class RecipeFormScreen  extends StatefulWidget {
  const RecipeFormScreen ({super.key});

  @override
  State<RecipeFormScreen> createState() => RecipeFormScreen_State();
}

class RecipeFormScreen_State extends State<RecipeFormScreen> {
  static const String IMAGE_URL ="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZVjaLBODwDcAurHoWU5QiISMlsVZyEQnufA&s";
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final userController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvelle recette",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor:  Colors.red[500],
      ),
      body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top:16.0,left: 16.0,right: 16.0, bottom: 8.0
                ),
                child: TextFormField(
                  controller: titleController ,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0 ))
                    )
                  ),
                  validator: (value){
                    final text = value ?? '';
                    if(text.isEmpty){
                      return 'Please enter a title';
                    }
                    return null;
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top:16.0,left: 16.0,right: 16.0, bottom: 8.0
                ),
                child: TextFormField(
                    controller: descriptionController  ,
                    decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0 ))
                        )
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 5,
                    validator: (value){
                      final text = value ?? '';
                      if(text.isEmpty){
                        return 'Please enter a Description';
                      }
                      return null;
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top:16.0,left: 16.0,right: 16.0, bottom: 8.0
                ),
                child: TextFormField(
                    controller: userController ,
                    decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0 ))
                        )
                    ),
                    validator: (value){
                      final text = value ?? '';
                      if(text.isEmpty){
                        return 'Please enter a username';
                      }
                      return null;
                    }
                ),
              ),
              
              SizedBox(height: 8.0,),
              Center(
                child: ElevatedButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        Recipe recipe = Recipe(
                          titleController.value.text,
                          userController.value.text,
                          IMAGE_URL,
                          descriptionController.value.text,
                          false,
                          new Random().nextInt(100)
                        );
                        RecipeBox.box?.put(recipe.key(),recipe);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Save')),
              )
            ],
          )
      ) ,
    );
  }
}
