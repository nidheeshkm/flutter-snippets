import 'package:MealsApp/models/meal.dart';
import 'package:MealsApp/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourite yet'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            duration: favouriteMeals[index].duration,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
            imageUrl: favouriteMeals[index].imageUrl,
            
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
