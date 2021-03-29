enum IssueType {
  Anomalie,
  Tache,
  Story,
}

enum TicketPriority {
  Bloquante,
  Haute,
  Moyenne,
  Basse,
}

extension IssueTypeExtension on IssueType {
  String get value {
    return this.toString().split('.').last;
  }
}

extension TicketPriorityExtension on TicketPriority {
  String get value {
    return this.toString().split('.').last;
  }
}
