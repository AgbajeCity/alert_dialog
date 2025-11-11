import 'package:flutter/material.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AlertDialog Demo'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: DeleteButton(),
        ),
      ),
    );
  }
}

// This is the main button that triggers the dialog
class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      // Pressing the button calls our function
      onPressed: () {
        _showDeleteConfirmation(context);
      },
      child: const Text('Delete Item'),
    );
  }

  // This function contains the logic to show the AlertDialog
  Future<void> _showDeleteConfirmation(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap a button!
      builder: (BuildContext context) {
        // This is the core widget
        return AlertDialog(
          // ATTRIBUTE 1: title
          // Controls the text at the top of the dialog.
          title: const Text('Confirm Deletion'),

          // ATTRIBUTE 2: content
          // The main body of the dialog. It can be any widget.
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this item?'),
                Text('This action cannot be undone.'),
              ],
            ),
          ),

          // ATTRIBUTE 3: actions
          // A list of widgets, usually buttons, at the bottom.
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Closes the dialog
              },
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop(); // Closes the dialog
                // In a real app, you would add delete logic here.
              },
            ),
          ],
        );
      },
    );
  }
}
