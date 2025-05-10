import 'package:flutter/material.dart';

class Semnumber extends StatefulWidget {
  final String selectedSemester; // Add this
  const Semnumber({super.key, required this.selectedSemester});

  @override
  State<Semnumber> createState() => _SemnumberState();
}

class _SemnumberState extends State<Semnumber> {
  final number = ["1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th"];

  final List<Color> colors = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.tealAccent,
    Colors.pinkAccent,
    Colors.amberAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: number.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          // Check if this semester is selected
          bool isSelected = widget.selectedSemester.startsWith(number[index]);
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: colors[index % colors.length],
            child: InkWell(
              onTap: () {
              },
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: Text(
                  number[index],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}