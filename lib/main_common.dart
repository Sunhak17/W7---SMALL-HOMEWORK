import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import 'ui/screens/favorite/favorite_screen.dart';
import 'ui/screens/library/library_screen.dart';
import 'ui/screens/settings/settings_screen.dart';
import 'ui/screens/home_screen/home_screen.dart';
import 'ui/states/settings_state.dart';
import 'ui/theme/theme.dart';

///
/// Launch the application with the given list of providers
///
void mainCommon(List<SingleChildWidget> providers) {
  runApp(
    MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp()),
    ),
  );
}
 

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [HomeScreen(), LibraryScreen(), FavoriteScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    
    // 1- Get the globbal settings state
    AppSettingsState settingsState = context.read<AppSettingsState>();
 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(
        body: _pages[_currentIndex],
    
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: settingsState.theme.color,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: 'Library',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
