
import 'package:flutter/material.dart';
import 'create_ticket_screen.dart'; // Import your CreateTicketScreen
import 'ticket_list_screen.dart';   // Import your TicketListScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticketing System'),
      ),
      body: TicketListScreen(), // Display the list of tickets
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to CreateTicketScreen when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTicketScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
