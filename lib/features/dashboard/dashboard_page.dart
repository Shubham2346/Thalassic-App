import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<IconData> _navIcons = [
    Icons.home_outlined,
    Icons.description_outlined,
    Icons.school_outlined,
    Icons.menu_book_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF2E7D89)),
              child: Center(
                child: Text(
                  "Menu",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
            ListTile(leading: Icon(Icons.info), title: Text("About")),
            ListTile(leading: Icon(Icons.contact_page), title: Text("Contact")),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 32,
            ),
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
      extendBodyBehindAppBar: true,

      /// Background + content
      body: Stack(
        children: [
          Image.asset(
            'assets/ocean_background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              children: [
                /// Logo
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/logo.png'),
                ),
                const SizedBox(height: 24),

                /// Title
                Text(
                  "Hari Om Thalassic",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 8),

                /// Subtitle
                Text(
                  "A Complete Seafarer's Home",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 16),

                /// Tagline
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Your trusted partner for maritime documentation, training, and job placements",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                  ),
                ),
              ],
            ),
          ),

          /// Floating call & quick action buttons
          Positioned(
            bottom: 80,
            left: 16,
            child: FloatingActionButton(
              heroTag: "call",
              backgroundColor: Colors.green,
              onPressed: () {
                // TODO: call action
              },
              child: const Icon(Icons.phone),
            ),
          ),
          Positioned(
            bottom: 80,
            right: 16,
            child: FloatingActionButton(
              heroTag: "service",
              backgroundColor: const Color(0xFF2E7D89),
              onPressed: () {
                // TODO: service action
              },
              child: const Icon(Icons.work_outline),
            ),
          ),
        ],
      ),

      /// Bottom Nav Bar
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(_navIcons[0]),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(_navIcons[1]),
            label: "Docs",
          ),
          BottomNavigationBarItem(
            icon: Icon(_navIcons[2]),
            label: "Training",
          ),
          BottomNavigationBarItem(
            icon: Icon(_navIcons[3]),
            label: "Blog",
          ),
          BottomNavigationBarItem(
            icon: Icon(_navIcons[4]),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}