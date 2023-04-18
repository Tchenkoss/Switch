import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/counter.dart';
import 'package:statemanagement/provider/switch_provider.dart';
import 'package:statemanagement/view/switchpage.dart';
import 'package:statemanagement/view/theme_screen.dart';
import 'view/favoritescreen.dart';
import 'view/slider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;
  bool isSwitch = false;

  // When we use SetState I rebuild or Update the Whole UI
  @override
  Widget build(BuildContext context) {
    //print('Stateful Widget');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('State Management (Provider)'),
      ),
      drawer: SafeArea(
        child: Drawer(
            backgroundColor: Colors.blue,
            child: ListView(
              children: const [
                ListTile(
                  title: Text(
                    'Home',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Product',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Contact',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text(
                    'About us',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Change color',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CountProvider>(
            builder: (context, value, child) {
              return Center(
                child: Text(
                  value.count.toString(),
                  style: const TextStyle(fontSize: 50),
                ),
              );
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SliderScreen(),
                ),
              );
            },
            child: const Text('Go to Slider Screen'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavouriteScreen(),
                ),
              );
            },
            child: const Text('Go to Favourite Screen'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThemeScreen(),
                ),
              );
            },
            child: const Text('Go to Theme Screen'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SwitchPage(),
                ),
              );
            },
            child: const Text('Go to Theme Switch Page'),
          ),
          Consumer<CountProvider>(
            builder: (context, value, child) {
              return BackButton(
                onPressed: () {
                  value.decrement();
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: Consumer<CountProvider>(
        builder: (context, value, child) {
          return FloatingActionButton(
            onPressed: () {
              value.setCount();
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
