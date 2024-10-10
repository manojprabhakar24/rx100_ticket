import 'package:flutter/material.dart';
import '../services/ticket_service.dart';

class CreateTicketScreen extends StatefulWidget {
  @override
  _CreateTicketScreenState createState() => _CreateTicketScreenState();
}

class _CreateTicketScreenState extends State<CreateTicketScreen> {
  final _formKey = GlobalKey<FormState>();
  String ticketName = '';
  String description = '';
  String status = 'Open';
  DateTime? dueDate;

  final TicketService _ticketService = TicketService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Ticket'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Ticket Name'),
                onChanged: (val) => ticketName = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (val) => description = val,
              ),
              DropdownButtonFormField(
                value: status,
                items: ['Open', 'Closed', 'On Hold'].map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (newValue) => setState(() {
                  status = newValue!;
                }),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _ticketService.createTicket(ticketName, description, status, dueDate ?? DateTime.now());
                    Navigator.pop(context); // Go back after submitting
                  }
                },
                child: Text('Submit Ticket'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
