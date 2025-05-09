import 'package:flutter/material.dart';
import 'package:intern/semslist.dart';

Future<void> showSemesterDialog({
  required BuildContext context,
  required String selectedSemester,
  required Function(String) onSelected,
}) {

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Less rounded corners
        ),
        title: const Text("Choose Semester", style: TextStyle(fontSize: 16),),
        content: SizedBox(
          width: 250,
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: semesters.length,
            itemBuilder: (context, index) {
              return RadioListTile<String>(
                dense: true,                 //it dense the alert box
                title: Text(semesters[index], style: TextStyle(fontSize: 12),),
                value: semesters[index],
                groupValue: selectedSemester,
                onChanged: (value) {
                  onSelected(value!);
                  Navigator.of(context).pop(); // Close dialog
                },
              );
            },
          ),
        ),
      );
    },
  );
}
