import 'package:flutter/foundation.dart';

import './app_enums.dart';

class AppTicket {
  final String id;
  final IssueType issueType;
  final TicketPriority priority;
  final String summary;
  final String description;
  final DateTime deadLine;

  AppTicket({
    @required this.id,
    @required this.issueType,
    @required this.priority,
    @required this.summary,
    @required this.description,
    @required this.deadLine,
  });
}
