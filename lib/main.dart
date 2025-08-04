import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/leaderboard_screen.dart';
import 'screens/announcements_screen.dart';

void main() {
  runApp(FundraisingApp());
}

class FundraisingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fundraising Intern Portal',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/leaderboard': (context) => LeaderboardScreen(),
        '/announcements': (context) => AnnouncementsScreen(),
      },
    );
  }
}