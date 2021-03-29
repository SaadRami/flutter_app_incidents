import 'package:app_gestion_incidents/data/app_enums.dart';
import "package:flutter/material.dart";

class AppTicketsUtil {
  static Icon getIssueIcon(IssueType issueType) {
    Icon issueIcon;
    switch (issueType) {
      case IssueType.Anomalie:
        issueIcon = Icon(
          Icons.bug_report_rounded,
          color: Colors.red,
        );
        break;
      case IssueType.Tache:
        issueIcon = Icon(
          Icons.check_box,
          color: Colors.blue,
        );
        break;
      case IssueType.Story:
        issueIcon = Icon(
          Icons.charging_station_rounded,
          color: Colors.purple,
        );
        break;
    }

    return issueIcon;
  }

  static Icon getPriorityIcon(TicketPriority priority) {
    Icon priorityIcon;
    switch (priority) {
      case TicketPriority.Haute:
        priorityIcon = Icon(
          Icons.arrow_circle_up_rounded,
          color: Colors.red,
        );
        break;
      case TicketPriority.Moyenne:
        priorityIcon =
            Icon(Icons.arrow_circle_down_rounded, color: Colors.green);
        break;
      case TicketPriority.Basse:
        priorityIcon = Icon(
          Icons.arrow_downward_outlined,
          color: Colors.grey,
        );
        break;
      case TicketPriority.Bloquante:
        priorityIcon = Icon(
          Icons.block,
          color: Colors.red,
        );
        break;
    }

    return priorityIcon;
  }
}
