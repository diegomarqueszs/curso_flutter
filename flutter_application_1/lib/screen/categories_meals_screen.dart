import 'package:flutter/material.dart';

import '../components/meal_item.dart';
import 'package:flutter_application_1/data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen(this.meals,{super.key});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    //utilizado para não ser preciso passar por construtor category
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((meal){
      return meal.categories.contains(category.id);
    }).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index){
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}