import 'package:flutter/material.dart';
import 'package:intern/semnumber.dart';

class Semesters extends StatelessWidget {
  final String selectedSemester;
  const Semesters({super.key, required this.selectedSemester}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Semesters',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Semnumber(selectedSemester: selectedSemester), // Pass to Semnumber
          ),
        ],
      ),
    );
  }
}