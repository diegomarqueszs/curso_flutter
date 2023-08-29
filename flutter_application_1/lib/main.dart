import 'package:flutter/material.dart';

import 'screen/tabs_screen.dart'; 
import 'screen/categories_screen.dart';
import 'screen/categories_meals_screen.dart';
import 'screen/meal_detail_screen.dart';
import 'screen/settings_screen.dart';

import 'utils/app_routes.dart';

import 'models/meal.dart';
import 'models/settings.dart';
import 'data/dummy_data.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Settings settings = Settings();
  List<Meal> _availableMeals  = dummyMeals;

  void _filterMeals(Settings settings){
    setState(() {
      this.settings = settings;
      
      _availableMeals = dummyMeals.where((meal){
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos cozinhar?',
      theme: ThemeData( 
        primarySwatch: Colors.pink,
        hintColor: Colors.amber,
        fontFamily: 'ReleWay',
        canvasColor: Color.fromARGB(255, 253, 244, 227),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          )
        )
        
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(), 
        AppRoutes.CATEGOREIS_MEALS: (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTIGNS: (ctx) => SettingsScreen(settings, _filterMeals),
      },
      //acesso a rota desconhecida
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_){
            return CategoriesScreen();
          },
        );
      },
    );
  }
}