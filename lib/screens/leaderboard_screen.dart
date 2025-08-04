import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> leaderboard = [
    {'name': 'Ayush Raj', 'donation': 5000},
    {'name': 'Neha Singh', 'donation': 4500},
    {'name': 'Ravi Verma', 'donation': 4000},
    {'name': 'Sneha Das', 'donation': 3500},
    {'name': 'Karan Patel', 'donation': 3000},
  ];

  void _navigateTo(String route, BuildContext context) {
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushReplacementNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Leaderboard")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: leaderboard.length,
        itemBuilder: (context, index) {
          final person = leaderboard[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(person['name']),
              trailing: Text("₹${person['donation']}"),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.teal,
        onTap: (index) {
          switch (index) {
            case 0:
              _navigateTo('/dashboard', context);
              break;
            case 1:
              _navigateTo('/leaderboard', context);
              break;
            case 2:
              _navigateTo('/announcements', context);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.announcement), label: 'Announcements'),
        ],
      ),
    );
  }
}
