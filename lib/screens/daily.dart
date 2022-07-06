import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:survey_pmdd/screens/id.dart';

import 'package:survey_pmdd/model/api_sheets.dart';
import 'resources.dart';
import 'nextsurv.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:survey_pmdd/cal_screen.dart';

import '/form_controller.dart';

class Daily extends StatelessWidget {
  const Daily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Daily Checklist'),
      ),
      body: MyDaily(),
    );
  }
}

class MyDaily extends StatefulWidget {
  const MyDaily({Key? key}) : super(key: key);

  @override
  _MyDailyState createState() => _MyDailyState();
}

class _MyDailyState extends State<MyDaily> {
  final _key = GlobalKey<QuestionFormState>();

  inputData() {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    String currentUseruid = user!.uid;
    return currentUseruid;
  }

  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyyMMdd');
    var strToday = formatter.format(now);
    return strToday;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

   // DatabaseReference indidatabaseRef = databaseRef.child(inputData());

    return Scaffold(
      body: ConditionalQuestions(
          key: _key,
          children: questions1(),
          trailing: [
            MaterialButton(
              color: Colors.redAccent[100],
              splashColor: Colors.red[100],
              child: Text("저장"),
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextSurv()));
                await SurvSheetsApi.insert_date(_key.currentState!.toMap());
              },
            )
          ]

      )
    );

  }
}


