import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';


class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _seletecdScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {'title': 'Lista de categorias', 'screen': CategoriesScreen()},
    {'title': 'Meus favoritos', 'screen': FavoriteScreen()},
    
  ];

  _selectedScreen(int index){
    setState(() {
      _seletecdScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text( _screens[_seletecdScreenIndex]['title'] as String),
        centerTitle: true,
       ),
       drawer: MainDrawer(),
       body: _screens[_seletecdScreenIndex]['screen'] as Widget,
       bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).hintColor,
        currentIndex: _seletecdScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
       ),
    );
  }
}