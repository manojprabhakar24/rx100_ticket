import 'package:flutter/material.dart';
import '../models/ticket.dart';

class TicketTile extends StatelessWidget {
  final Ticket ticket;

  const TicketTile({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(ticket.name),
        subtitle: Text(ticket.description),
        trailing: Text(ticket.status),
        onTap: () {
          // Optionally handle ticket tap (e.g., navigate to details)
        },
      ),
    );
  }
}
