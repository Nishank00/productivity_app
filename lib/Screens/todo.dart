import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 11.0,
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            TableCalendar(
              calendarController: _calendarController,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                  selectedColor: Color(0xff303074b),
                  todayColor: Color(0xff3037b),
                  weekendStyle: TextStyle(color: Colors.black)),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: Color(0xff30384c),
                  fontWeight: FontWeight.bold,
                ),
                weekendStyle: TextStyle(
                  color: Color(0xff30384c),
                  fontWeight: FontWeight.bold,
                ),
              ),
              headerStyle: HeaderStyle(formatButtonVisible: false),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff30384c),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0))),
                padding: EdgeInsets.only(),
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 30, left: 30),
                          child: Text(
                            "Todays Task's",
                            style: TextStyle(
                              fontFamily: 'ProductSans',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
