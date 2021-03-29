import 'package:app_gestion_incidents/util/app_util.dart';
import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../data/ticket.dart";
import "../data/app_enums.dart";

class TicketList extends StatelessWidget {
  List<AppTicket> _tickets;

  TicketList(List<AppTicket> tickets) {
    _tickets = tickets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _tickets.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.no_stroller_sharp),
                Container(
                  child: Image.asset(
                    "path",
                    fit: BoxFit.cover,
                  ),
                ),
                Text("Aucun ticket n'a été créé pour ce projet."),
              ],
            )
          : ListView.builder(
              itemCount: _tickets.length,
              itemBuilder: (context, index) {
                final AppTicket listItem = _tickets.elementAt(index);
                Icon issueIcon =
                    AppTicketsUtil.getIssueIcon(listItem.issueType);
                Icon priorityIcon =
                    AppTicketsUtil.getPriorityIcon(listItem.priority);

                return Card(
                  elevation: 2,
                  //color: Colors.white70,
                  child: Container(
                    /*  decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ), */
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            issueIcon,
                            /* Text(
                              ticket.issueType.value,
                            ), */
                            SizedBox(width: 10),
                            Text(
                              listItem.summary,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  listItem.id,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                SizedBox(width: 10),
                                // Text("${listItem.priority.value}"),
                                priorityIcon,
                              ],
                            ),
                            Text(
                              // DateFormat.yMMMMd().format(listItem.date),
                              DateFormat("dd-MM-yyyy")
                                  .format(listItem.deadLine),
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              /* children: [
          Row(
            children: [
              Text("Tickets : "),
              Text(
                "${_tickets.length} Ticket",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ],
          ),
          ..._tickets.map((ticket) {
            return Card(
              elevation: 2,
              //color: Colors.white70,
              child: Container(
                /*  decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ), */
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ticket.issueType.value,
                        ),
                        SizedBox(width: 10),
                        Text(
                          ticket.summary,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              ticket.id,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[400],
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("${ticket.priority.value}"),
                          ],
                        ),
                        Text(
                          DateFormat.yMMMMd().format(ticket.date),
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ], */
            ),
    );
  }
}
