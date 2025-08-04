import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String internName = "Ayush Raj";
  final String referralCode = "Ayush2025";
  final String totalDonations = "₹5,000";

  void _navigateTo(String route, BuildContext context) {
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushReplacementNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome, $internName", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text("Referral Code: $referralCode", style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Card(
                elevation: 4,
                color: Colors.teal[50],
                child: ListTile(
                  leading: Icon(Icons.attach_money, color: Colors.teal),
                  title: Text("Total Donations Raised"),
                  subtitle: Text(totalDonations, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 24),
              Text("Rewards", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildRewardCard("Bronze Badge", Icons.emoji_events),
                  _buildRewardCard("Silver Badge", Icons.star),
                  _buildRewardCard("Gold Badge", Icons.workspace_premium),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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

  Widget _buildRewardCard(String title, IconData icon) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, color: Colors.teal, size: 36),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
