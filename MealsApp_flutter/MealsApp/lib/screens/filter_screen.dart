import 'package:MealsApp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilters;
  FilterScreen(this.saveFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegen': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildSwitchListTile("Gluten-free",
                      'Only include Gluten-free meals', _glutenFree, (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  }),
                  buildSwitchListTile("Lactose-free",
                      'Only include Lactose-free meals', _lactoseFree, (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  }),
                  buildSwitchListTile("Vegetarian",
                      'Only include vegeterian meals', _vegetarian, (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  }),
                  buildSwitchListTile(
                      "Vegen", 'Only include Vegen meals', _vegan, (value) {
                    setState(() {
                      _vegan = value;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }

  SwitchListTile buildSwitchListTile(
      String title, String description, bool value, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }
}
