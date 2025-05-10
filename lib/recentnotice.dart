import 'package:flutter/material.dart';

class Recentnotice extends StatefulWidget {
  const Recentnotice({super.key});

  @override
  State<Recentnotice> createState() => _RecentnoticeState();
}

class _RecentnoticeState extends State<Recentnotice> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
                children: [
                  const Text('Semester Notice'),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () {},
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
    );
       }
     }