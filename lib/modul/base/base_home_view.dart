import 'package:flutter/material.dart';
import 'package:lazday_kuliner/data/model/home_menu_model.dart';
import 'package:lazday_kuliner/modul/favorite/favorite_view.dart';
import 'package:lazday_kuliner/modul/home/home_view.dart';
import 'package:lazday_kuliner/modul/profile/profile_view.dart';

class BaseHomeView extends StatefulWidget {
  const BaseHomeView({super.key});

  @override
  State<BaseHomeView> createState() => _BaseHomeViewState();
}

class _BaseHomeViewState extends State<BaseHomeView> {
  // ignore: prefer_final_fields
  int _menuSelected = 0;
  HomeMenu _homeMenu = HomeMenu.placeSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _buildCOntainerView(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        currentIndex: _menuSelected,
        selectedItemColor: Colors.pink,
        onTap: _onMenuTapped,
      ),
    );
  }

  Widget _buildCOntainerView() {
    if (_homeMenu == HomeMenu.placeSelected) {
      return const HomeView();
    } else if (_homeMenu == HomeMenu.favoriteSelected) {
      return const FavoriteView();
    } else if (_homeMenu == HomeMenu.profileSelected) {
      return const ProfileView();
    } else {
      return Container();
    }
  }

  void _onMenuTapped(int index) {
    print('_onmenuTapped ${index.toString()}');
    setState(() {
      _menuSelected = index;

      switch (_menuSelected) {
        case 0:
          _homeMenu = HomeMenu.placeSelected;
          break;
        case 1:
          _homeMenu = HomeMenu.favoriteSelected;
          break;
        case 2:
          _homeMenu = HomeMenu.profileSelected;
          break;
        default:
      }
    });
  }
}
