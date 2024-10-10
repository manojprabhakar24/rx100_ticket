import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/ticket.dart';

class TicketService {
  final CollectionReference ticketsCollection = FirebaseFirestore.instance.collection('tickets');

  Future<void> createTicket(String name, String description, String status, DateTime dueDate) async {
    await ticketsCollection.add({
      'name': name,
      'description': description,
      'status': status,
      'dueDate': dueDate,
      'createdAt': DateTime.now(),
    });
  }

  Stream<List<Ticket>> getTickets({String? status}) {
    Query query = ticketsCollection;

    if (status != null && status != 'All') {
      query = ticketsCollection.where('status', isEqualTo: status);
    }

    return query.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Ticket(
          id: doc.id,
          name: doc['name'],
          description: doc['description'],
          status: doc['status'],
          dueDate: (doc['dueDate'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  Future<void> updateTicketStatus(String ticketId, String newStatus) async {
    await ticketsCollection.doc(ticketId).update({'status': newStatus});
  }

  Future<Map<String, int>> getTicketCounts() async {
    final snapshot = await ticketsCollection.get();
    int totalTickets = snapshot.docs.length;
    int openTickets = 0;
    int closedTickets = 0;
    int onHoldTickets = 0;

    for (var doc in snapshot.docs) {
      String status = doc['status'];
      if (status == 'Open') openTickets++;
      if (status == 'Closed') closedTickets++;
      if (status == 'On Hold') onHoldTickets++;
    }

    return {
      'total': totalTickets,
      'open': openTickets,
      'closed': closedTickets,
      'onHold': onHoldTickets,
    };
  }
}
