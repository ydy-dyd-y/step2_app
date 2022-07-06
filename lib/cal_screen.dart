import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:collection';
import 'dart:math';  // Random
import 'package:intl/intl.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:survey_pmdd/screens/dailycategory.dart';
import 'package:survey_pmdd/screens/weekly.dart';
import 'package:survey_pmdd/screens/info.dart';

//import 'package:survey_pmdd/api/notification_api.dart'; 2022-07-06
import 'screens/EMAam.dart';
import 'screens/daily.dart';

class CalScreen extends StatefulWidget {
  const CalScreen({Key? key}) : super(key: key);

  @override
  _CalScreenState createState() => _CalScreenState();
}

class _CalScreenState extends State<CalScreen> {

  final isDialOpen = ValueNotifier(false);

  MeetingDataSource? _events;

  DatabaseReference databaseRef = FirebaseDatabase.instance.ref(inputData());

  DataSnapshot? mense;
  dynamic data;

/* 2022-07-06

  @override
  void initState() {
    super.initState();

    NotificationApi.init(initScheduled: true);
    listenNotifications();
    listenNotifications2();

    ///   NotificationApi.showScheduledNotification(
    ///     title: '9:30am',
    ///     body: '아침 설문을 작성하실 시간입니다',
    ///     scheduledDate: DateTime.now(),
    ///   );
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EMAam()
      ));


  void listenNotifications2() =>
      NotificationApi.onNotifications2.stream.listen(onClickedNotification2);

  void onClickedNotification2(String? payload) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Daily()
      ));
*/


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          /// close speed dial
          isDialOpen.value = false;

          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
          backgroundColor: Colors.redAccent[100],
          actions: [
            IconButton(
              icon: Icon(
                Icons.exit_to_app_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            )
          ],
        ),
        body: SfCalendar(
          view: CalendarView.month,
          dataSource: _events, //MeetingDataSource(getAppointments()),
        ),

        floatingActionButton: SpeedDial(
            icon: Icons.add,
            backgroundColor: Colors.black,
            overlayColor: Colors.black12,
            overlayOpacity: 0.4,
            children: [
              SpeedDialChild(
                  child: Icon(Icons.person),
                  label: 'My Info',
                  backgroundColor: Colors.redAccent[100],
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => Info())
                    );
                  }
              ),
              SpeedDialChild(
                  child: Icon(Icons.list),
                  label: 'Weekly\nChecklist',
                  backgroundColor: Colors.redAccent[100],
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => Weekly())
                    );
                  }
              ),

              SpeedDialChild(
                  child: Icon(Icons.calendar_view_month),
                  backgroundColor: Colors.redAccent[100],
                  label: 'Daily\nChecklist',
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => DailyCate())
                    );
                  }
              ),
            ]
        ),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments =  source;
  }
  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}


class Meeting {
  String? eventName;
  DateTime? from;
  DateTime? to;
  Color? background;
  bool? isAllday;

  Meeting({this.eventName, this.from, this.to, this.background, this.isAllday});
}



///
Map<String, String> userid = {
  'c55R9RxIzkcjOLyxK3ZcQDnPrWl1': 'pmdd_1',
  'gBuUbbGz1RQJfeHLoeEIieELnq13': 'pmdd_2',
  '5N1CBDtxH6NwP0jH6xxD8hZ4wJS2': 'pmdd_3'
};

//
inputData() {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;
  String currentUseruid = user!.uid;
  return userid[currentUseruid];
}


