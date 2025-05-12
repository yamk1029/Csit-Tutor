import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'services/notice_service.dart'; // Make sure path is correct

class Recentnotice extends StatefulWidget {
  const Recentnotice({super.key});

  @override
  State<Recentnotice> createState() => _RecentnoticeState();
}

class _RecentnoticeState extends State<Recentnotice> {
  late Future<List<Map<String, String>>> _noticesFuture;

  @override
  void initState() {
    super.initState();
    _noticesFuture = fetchNotices();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Semester Notice'),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  // Optional: Show all notices on new page
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.redAccent),
                ),
                child: const Text(
                  'See All',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          FutureBuilder<List<Map<String, String>>>(
            future: _noticesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Failed to load notices: ${snapshot.error}');
              }

              final notices = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: notices.length >= 3 ? 3 : notices.length,
                itemBuilder: (context, index) {
                  final notice = notices[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(notice['title']!),
                    onTap: () => launchUrl(Uri.parse(notice['link']!)),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
