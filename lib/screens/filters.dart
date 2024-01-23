import 'package:flutter/material.dart';

//import 'package:meals/widgets/main_drawer.dart';
//import 'package:meals/screens/tabs.dart';
enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter
        .glutenFree]!; //@ Using widget you can access values inside the statefull widget
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      //drawer: MainDrawer(
      //  onSelectScreen: (identifier) {
      //    //@This way of passing the annonymous function is very clever. Try to understand it
      //    Navigator.of(context).pop();
      //    if (identifier == 'Meals') {
      //      Navigator.of(context).pushReplacement(
      //        MaterialPageRoute(
      //          builder: (ctx) => const TabsScreen(),
      //        ),
      //      );
      //    }
      //  },
      //),
      body: PopScope(
        //@ This is very clever, Because canPop is false, now all backing bottoms are disable
        //@ However that does not prevent from someone trying to leave, since canPop is false
        //@ didPop will always be false, however we will pop "manually" using the Navigator.of(context)
        //@ It all makes sense, please think.
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              //@Single Row full of switches
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(
                  () {
                    _glutenFreeFilterSet = isChecked;
                  },
                );
              },
              title: Text(
                "Gluten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only include gluten-free meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              //@Single Row full of switches
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(
                  () {
                    _lactoseFreeFilterSet = isChecked;
                  },
                );
              },
              title: Text(
                "Lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only include lactose-free meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              //@Single Row full of switches
              value: _vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(
                  () {
                    _vegetarianFilterSet = isChecked;
                  },
                );
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only include vegetarian meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              //@Single Row full of switches
              value: _veganFilterSet,
              onChanged: (isChecked) {
                setState(
                  () {
                    _veganFilterSet = isChecked;
                  },
                );
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only include vegan meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
