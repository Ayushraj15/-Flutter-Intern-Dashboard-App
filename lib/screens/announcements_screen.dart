import 'package:flutter/material.dart';

void _navigateTo(String route, BuildContext context) {
  if (ModalRoute.of(context)?.settings.name != route) {
    Navigator.pushReplacementNamed(context, route);
  }
}

class AnnouncementsScreen extends StatelessWidget {
  final List<String> announcements = [
    "🎉 New badge system launched! Earn more by raising funds.",
    "📅 Next intern meeting on Monday at 10 AM.",
    "🚀 Top 3 fundraisers of the week will receive bonus rewards.",
    "🔔 Reminder: Submit your weekly report by Friday 5 PM."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Announcements")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: announcements.length,
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                announcements[index],
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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