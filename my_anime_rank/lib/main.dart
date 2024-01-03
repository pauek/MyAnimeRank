import 'package:flutter/material.dart';
import 'package:my_anime_rank/screens/home_screen/home_screen.dart';
import 'package:my_anime_rank/screens/character_screen/character_screen.dart';
import 'package:my_anime_rank/discover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const HomeScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // Customize the transition for the characterDemo route
                // You can use different transition effects for each route
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          case '/characterDemo':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const CharacterScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // Customize the transition for the characterDemo route
                // You can use different transition effects for each route
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              settings: RouteSettings(
                arguments: settings.arguments as int,
              ),
            );
          case '/discoverDemo':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const DiscoverScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // Customize the transition for the characterDemo route
                // You can use different transition effects for each route
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          default:
            // If the route is not found, you can return a default page or navigate to an error page
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                body: Center(
                  child: Text('Route not found'),
                ),
              ),
            );
        }
      },
    );
  }
}
