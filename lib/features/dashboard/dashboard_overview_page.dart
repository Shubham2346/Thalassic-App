import 'package:flutter/material.dart';

class DashboardOverviewPage extends StatelessWidget {
  const DashboardOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = "Rajesh"; // replace with actual user data
    final profileCompletion = 0.98;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Overview"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Welcome card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back, $userName!",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Maritime Professional Dashboard",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: profileCompletion,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(8),
                    backgroundColor: Colors.white24,
                    color: Colors.greenAccent,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${(profileCompletion * 100).round()}% Profile Complete",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            /// Section cards
            Expanded(
              child: ListView(
                children: [
                  _dashboardTile(
                    context,
                    icon: Icons.person_outline,
                    title: "User Profile",
                    subtitle: "Personal & family details",
                    status: "Complete",
                    statusColor: Colors.green,
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                  _dashboardTile(
                    context,
                    icon: Icons.phone_outlined,
                    title: "Contact Information",
                    subtitle: "Address & communication details",
                    status: "Complete",
                    statusColor: Colors.green,
                    onTap: () {},
                  ),
                  _dashboardTile(
                    context,
                    icon: Icons.description_outlined,
                    title: "Document Details",
                    subtitle: "Passport, INDOS, CDC certificates",
                    status: "Valid",
                    statusColor: Colors.blue,
                    onTap: () => Navigator.pushNamed(context, '/documents'),
                  ),
                  _dashboardTile(
                    context,
                    icon: Icons.school_outlined,
                    title: "Educational Background",
                    subtitle: "Academic qualifications",
                    status: "Complete",
                    statusColor: Colors.green,
                    onTap: () => Navigator.pushNamed(context, '/education'),
                  ),
                  _dashboardTile(
                    context,
                    icon: Icons.book_outlined,
                    title: "Course & Training",
                    subtitle: "Pre-sea, modular & bridge courses",
                    status: "13 Courses",
                    statusColor: Colors.purple,
                    onTap: () => Navigator.pushNamed(context, '/training'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String status,
    required Color statusColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.teal),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      )),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
