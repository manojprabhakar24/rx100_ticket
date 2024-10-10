class Ticket {
  final String id;
  final String name;
  final String description;
  final String status;
  final DateTime dueDate;

  Ticket({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.dueDate,
  });
}
