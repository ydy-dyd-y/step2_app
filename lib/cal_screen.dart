import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';


import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:survey_pmdd/screens/dailycategory.dart';
import 'package:survey_pmdd/screens/weekly.dart';
import 'package:survey_pmdd/screens/info.dart';


class CalScreen extends StatefulWidget {
  const CalScreen({Key? key}) : super(key: key);

  @override
  _CalScreenState createState() => _CalScreenState();
}

class _CalScreenState extends State<CalScreen> {

  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  final isDialOpen = ValueNotifier(false);

  MeetingDataSource? _events;

  DatabaseReference databaseRef = FirebaseDatabase.instance.ref(inputData());

  DataSnapshot? mense;
  dynamic data;

  @override
  void initState() {
    super.initState();

    loadFCM();

    listenFCM();
  }

  void listenFCM() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
  }

  void loadFCM() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        importance: Importance.high,
        enableVibration: true,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }


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


