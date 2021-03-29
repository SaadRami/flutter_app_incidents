import "package:flutter/material.dart";

import './data/app_enums.dart';
import './data/ticket.dart';
import './widgets/new_ticket_card.dart';
import './widgets/ticket_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gestion d'incidents",
      home: TicketPage(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.white,
        //  fontFamily: "OpenSans",
      ),
    );
  }
}

class TicketPage extends StatefulWidget {
  /*  String _summaryInput;
  String _descriptionInput; */
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final List<AppTicket> _tickets = [
    AppTicket(
      id: "T1",
      summary: "Bug 1",
      description: "Anomalie bloquante",
      priority: TicketPriority.Haute,
      issueType: IssueType.Anomalie,
      deadLine: DateTime.now(),
    ),
    AppTicket(
      id: "T2",
      summary: "Bug 2",
      description: "Anomalie normale",
      priority: TicketPriority.Moyenne,
      issueType: IssueType.Anomalie,
      deadLine: DateTime.now(),
    ),
    AppTicket(
      id: "T3",
      summary: "Tache 1",
      description: "Tache X",
      priority: TicketPriority.Bloquante,
      issueType: IssueType.Tache,
      deadLine: DateTime.now(),
    ),
    AppTicket(
      id: "T4",
      summary: "Story 1",
      description: "Anomalie normale",
      priority: TicketPriority.Basse,
      issueType: IssueType.Story,
      deadLine: DateTime.now(),
    ),
  ];

  void _addTicket(
    String summary,
    String description,
    IssueType issueType,
    TicketPriority priority,
  ) {
    final newTicket = AppTicket(
      id: "T3",
      deadLine: DateTime.now(),
      description: description,
      summary: summary,
      issueType: issueType,
      priority: priority,
    );

    setState(() {
      _tickets.add(newTicket);
    });
  }

  void _openAddTicketView(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTicketCard(_addTicket);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Initializing state

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _openAddTicketView(context);
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: AppBar(
        title: Text("Gestion d'incidents"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () {
              _openAddTicketView(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 2,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Card(
                  color: Colors.grey,
                  child: Text("Test"),
                  elevation: 5.0,
                ),
              ),
              TicketList(_tickets),
            ],
          ),
        ),
      ),
    );
  }
}
