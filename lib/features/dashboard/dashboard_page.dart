import 'package:flutter/material.dart';

// Import your feature pages
import '../profile/profile_page.dart';
import '../documents/documents_page.dart';
import '../education/education_page.dart';
import '../training/training_page.dart';
import '../sea_service/sea_service_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _pages =  [
    ProfilePage(),
    DocumentsPage(),
    EducationPage(),
    TrainingPage(),
    SeaServicePage(),
  ];

  final List<IconData> _navIcons = [
    Icons.person_outline,       // Profile
    Icons.description_outlined, // Documents
    Icons.menu_book_outlined,   // Education
    Icons.school_outlined,      // Training
    Icons.anchor_outlined,      // Sea Services
  ];

  final List<String> _navLabels = [
    "Profile",
    "Documents",
    "Education",
    "Training",
    "Sea Services",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF2E7D89)),
              child: Center(
                child: Text(
                  "Menu",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Home"),
              onTap: () => Navigator.pushReplacementNamed(context, '/home'),
            ),
            ListTile(
              leading: const Icon(Icons.menu_book_outlined),
              title: const Text("Courses"),
              onTap: () => Navigator.pushNamed(context, '/courses'),
            ),
            ListTile(
              leading: const Icon(Icons.work_outline),
              title: const Text("Services"),
              onTap: () => Navigator.pushNamed(context, '/services'),
            ),
            ListTile(
              leading: const Icon(Icons.article_outlined),
              title: const Text("Blog"),
              onTap: () => Navigator.pushNamed(context, '/blog'),
            ),
            ListTile(
              leading: const Icon(Icons.contact_page_outlined),
              title: const Text("Contact"),
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("About Us"),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () {
                // TODO: logout logic
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 32),
            const SizedBox(width: 8),
            const Text(
              "Hari Om Thalassic",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: const Text("RK"),
          ),
          const SizedBox(width: 16),
        ],
      ),

      /// Body swaps with nav index
      body: _pages[_currentIndex],

      /// Floating call & quick action buttons (visible only on home/dashboard)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _currentIndex == 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 30), // spacing
                FloatingActionButton(
                  heroTag: "call",
                  backgroundColor: Colors.green,
                  onPressed: () {
                    // TODO: call
                  },
                  child: const Icon(Icons.phone),
                ),
                FloatingActionButton(
                  heroTag: "service",
                  backgroundColor: const Color(0xFF2E7D89),
                  onPressed: () {
                    // TODO: service action
                  },
                  child: const Icon(Icons.work_outline),
                ),
                const SizedBox(width: 30), // spacing
              ],
            )
          : null,

      /// Bottom navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF2E7D89),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          _navIcons.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(_navIcons[index]),
            label: _navLabels[index],
          ),
        ),
      ),
    );
  }
}
