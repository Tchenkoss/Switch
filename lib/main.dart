import 'package:flutter/material.dart';
import 'package:statemanagement/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/counter.dart';
import 'package:statemanagement/provider/drawerchangerprovider.dart';
import 'package:statemanagement/provider/slider.dart';
import 'package:statemanagement/provider/switch_provider.dart';
import 'package:statemanagement/provider/themechanger.dart';

import 'provider/favorite_provider.dart';

void main() {
  runApp(const StateManagement());
}

class StateManagement extends StatelessWidget {
  const StateManagement({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountProvider>(create: (_) => CountProvider()),
        ChangeNotifierProvider<SliderProvider>(create: (_) => SliderProvider()),
        ChangeNotifierProvider<FavouriteProvider>(
            create: (_) => FavouriteProvider()),
        ChangeNotifierProvider<ThemeChangerProvider>(
            create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider<DrawerChanger>(create: (_) => DrawerChanger()),
        ChangeNotifierProvider<SwitchProvider>(create: (_) => SwitchProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        final themeProvider = Provider.of<ThemeChangerProvider>(context);
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          title: 'State Management course',
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.red,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(brightness: Brightness.dark),
          home: HomeScreen(),
        );
      }),
    );
  }
}
