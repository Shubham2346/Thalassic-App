import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final ScrollController _scrollController = ScrollController();

  // Keys for sections
  final GlobalKey _comparisonKey = GlobalKey();
  final GlobalKey _teamKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: const Text("About Us"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// HERO SECTION
              Stack(
                children: [
                  Image.asset(
                    "assets/images/ocean_bg.jpg",
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.black.withOpacity(0.4),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Navigating Excellence in\nMaritime Services",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Discover how Hari Om Thalassic became the trusted partner\nfor thousands of seafarers worldwide.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white70),
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 12,
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    _scrollToSection(_comparisonKey),
                                child: const Text("Our Difference"),
                              ),
                              OutlinedButton(
                                onPressed: () => _scrollToSection(_teamKey),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side:
                                      const BorderSide(color: Colors.white),
                                ),
                                child: const Text("Meet Our Team"),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 24),

              /// ABOUT / STORY SECTION (Responsive Row/Column)
              Padding(
                padding: const EdgeInsets.all(16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 600) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _storyStatsCard(),
                          const SizedBox(height: 12),
                          _storyText(context),
                        ],
                      );
                    }
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _storyStatsCard()),
                        const SizedBox(width: 12),
                        Expanded(flex: 2, child: _storyText(context)),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              /// MISSION & VISION (Responsive)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 600) {
                      return Column(
                        children: [
                          _missionCard(),
                          const SizedBox(height: 12),
                          _visionCard(),
                        ],
                      );
                    }
                    return Row(
                      children: [
                        Expanded(child: _missionCard()),
                        const SizedBox(width: 12),
                        Expanded(child: _visionCard()),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              /// COMPARISON TABLE (with horizontal scroll)
              Padding(
                key: _comparisonKey,
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text("Feature")),
                        DataColumn(label: Text("Hari Om Thalassic")),
                        DataColumn(label: Text("Others")),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text("Transparency")),
                          DataCell(Text("✅")),
                          DataCell(Text("❌")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Direct Hiring")),
                          DataCell(Text("✅")),
                          DataCell(Text("❌")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("24/7 Support")),
                          DataCell(Text("✅")),
                          DataCell(Text("❌")),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),

              /// CORE VALUES
              Container(
                color: Colors.blue.shade50,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our Core Values",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    _valueCard(context, "Integrity",
                        "We build trust by being transparent and honest."),
                    _valueCard(context, "Commitment",
                        "Dedicated support for seafarers, anytime, anywhere."),
                    _valueCard(context, "Excellence",
                        "We aim for the highest standards in all we do."),
                    _valueCard(context, "Innovation",
                        "Adapting to new challenges with creativity."),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// TEAM SECTION
              Padding(
                key: _teamKey,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Our Team",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    _teamMember("assets/images/team1.jpg", "Capt. John Smith",
                        "Founder & CEO"),
                    _teamMember("assets/images/team2.jpg", "Sarah Johnson",
                        "Operations Head"),
                    _teamMember("assets/images/team3.jpg", "Michael Lee",
                        "HR & Recruitment"),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              /// CTA FOOTER
              Container(
                color: Colors.blue.shade800,
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      "Ready to Navigate Your Maritime Career?",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/create-account');
                      },
                      child: const Text("Register Now"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// --- Helper Widgets ---

  Widget _storyStatsCard() {
    return Card(
      color: Colors.blue.shade800,
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Established 2010",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "13+ Years Experience\n5,000+ Seafarers Served",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _storyText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Chip(label: Text("Our Story")),
        const SizedBox(height: 8),
        Text(
          "Charting the Course of Maritime Excellence",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "Founded in 2010, Hari Om Thalassic began as a small venture with a bold vision: to empower seafarers and transform maritime recruitment. Over the years, we’ve grown into a trusted partner for thousands of professionals and companies worldwide.",
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _missionCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.flag, color: Colors.blue, size: 36),
            const SizedBox(height: 8),
            Text("Our Mission",
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(
              "To empower seafarers at every stage of their journey through trust, guidance, and global opportunities.",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _visionCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.visibility, color: Colors.blue, size: 36),
            const SizedBox(height: 8),
            Text("Our Vision",
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(
              "To become the most trusted maritime partner by 2030, setting global standards in recruitment and seafarer care.",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _valueCard(BuildContext context, String title, String desc) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              desc,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }

  Widget _teamMember(String img, String name, String role) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(radius: 32, backgroundImage: AssetImage(img)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
                Text(role,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
