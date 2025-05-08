import 'package:flutter/material.dart';
import 'package:intern/semesterdialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _selectedSemester = "1st Semester"; // this is semester state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CSIT Tutor'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton(
            itemBuilder: (context) {
              return const [
                PopupMenuItem(child: Text('About')),
                PopupMenuItem(child: Text('Rate Us')),
                PopupMenuItem(child: Text('Send Feedback')),
                PopupMenuItem(child: Text('Terms of Service')),
              ];
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.redAccent),
              child: Text('CSIT Tutor'),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notice'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Downloads'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.newspaper),
              title: const Text('Tech News'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Tech Jobs'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Exit'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Text('Semester Subjects'),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {
                    showSemesterDialog(
                      context: context,
                      selectedSemester: _selectedSemester,
                      onSelected: (value) {
                        setState(() {
                          _selectedSemester = value;
                        });
                      },
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.redAccent),
                  ),
                  child: const Text(
                    'Change',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}