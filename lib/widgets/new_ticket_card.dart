import 'package:app_gestion_incidents/data/app_enums.dart';
import 'package:app_gestion_incidents/util/app_util.dart';
import "package:flutter/material.dart";
import 'package:flutter/scheduler.dart';

class NewTicketCard extends StatefulWidget {
  Function _onAddTicketHandler;

  void _testBehavior() {
    print("test");
  }

  NewTicketCard(this._onAddTicketHandler);

  @override
  _NewTicketCardState createState() => _NewTicketCardState();
}

class _NewTicketCardState extends State<NewTicketCard> {
  final summaryController = TextEditingController();
  final descriptionController = TextEditingController();

  var dropDownIssueValue = IssueType.Anomalie;
  var dropDownPriorityValue = TicketPriority.Haute;

  void _addTicket() {
    final summaryInput = summaryController.text;
    final descriptionInput = descriptionController.text;

    if (summaryInput.isEmpty || descriptionInput.isEmpty) {
      return;
    }

    // la propriété widget donne accès à l'état et comportement de la classe widget à partir de la classe statement correspondante
    //widget._testBehavior();
    // TOUJOURS SE SOUVENIR DE CA STP

    widget._onAddTicketHandler(
      summaryInput,
      descriptionInput,
      dropDownIssueValue,
      dropDownPriorityValue,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 3,
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<IssueType>(
                      value: dropDownIssueValue,
                      items: [
                        IssueType.Anomalie,
                        IssueType.Tache,
                        IssueType.Story,
                      ].map<DropdownMenuItem<IssueType>>((issueType) {
                        return DropdownMenuItem<IssueType>(
                          value: issueType,
                          child: new Row(
                            children: [
                              AppTicketsUtil.getIssueIcon(issueType),
                              SizedBox(width: 10),
                              Text(
                                issueType.value,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropDownIssueValue = newValue;
                        });
                      },
                    ),
                    DropdownButton<TicketPriority>(
                      value: dropDownPriorityValue,
                      items: [
                        TicketPriority.Haute,
                        TicketPriority.Basse,
                        TicketPriority.Moyenne,
                        TicketPriority.Bloquante,
                      ].map<DropdownMenuItem<TicketPriority>>((priority) {
                        return DropdownMenuItem<TicketPriority>(
                          value: priority,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppTicketsUtil.getPriorityIcon(priority),
                              SizedBox(width: 10),
                              Text(
                                priority.value,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropDownPriorityValue = newValue;
                        });
                      },
                    ),
                  ],
                ),
                TextField(
                  controller: summaryController,
                  onSubmitted: (_) => _addTicket(),
                  //onChanged: (val) => _summaryInput = val,
                  decoration: InputDecoration(
                    labelText: "Summary",
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  onSubmitted: (_) => _addTicket(),
                  // onChanged: (val) => _descriptionInput = val,
                  decoration: InputDecoration(
                    labelText: "Description",
                  ),
                ),
              ],
            ),
            TextButton.icon(
              icon: Icon(Icons.add),
              label: Text("Ajouter le ticket"),
              onPressed: _addTicket,
              //child: Text("Ajouter le ticket"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
