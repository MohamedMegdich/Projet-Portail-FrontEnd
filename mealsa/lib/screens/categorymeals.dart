import 'package:flutter/material.dart';
import '../widgets/meals_item.dart';
import '../dummy_data.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/cataMeals';

  //final String id;
  //final String title;
  //CategoryMeals(this.id, this.title);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final cataid = routeArgs['id'];
    final catatitle = routeArgs['title'];
    final categMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(cataid);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catatitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Mealsitem(
              title: categMeals[index].title,
              imageUrl: categMeals[index].imageUrl,
              duration: categMeals[index].duration,
              complexity: categMeals[index].complexity,
              affordability: categMeals[index].affordability);
        },
        itemCount: categMeals.length,
      ),
    );
  }
}
