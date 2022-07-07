import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:survey_pmdd/screens/boardam.dart';

import 'resources.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:survey_pmdd/cal_screen.dart';

import '/form_controller.dart';
import '/model/user.dart';
import 'package:survey_pmdd/model/api_sheets.dart';

class EMApmNext extends StatelessWidget {
  const EMApmNext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Daily Checklist'),
      ),
      body: MyEMApmNext(),
    );
  }
}

class MyEMApmNext extends StatefulWidget {
  const MyEMApmNext({Key? key}) : super(key: key);

  @override
  _MyEMApmNextState createState() => _MyEMApmNextState();
}

class _MyEMApmNextState extends State<MyEMApmNext> {

  final _key = GlobalKey<QuestionFormState>();
//

  String inputData() {
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
    return Scaffold(
      body: ConditionalQuestions(
          key: _key,
          children: questions1_2_4(),
          trailing: [
            MaterialButton(
              color: Colors.redAccent[100],
              splashColor: Colors.red[100],
              child: Text("제출"),
              onPressed: () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CalScreen())
                );
                await SurvSheetsApi.insertpmM(_key.currentState!.toMap());

              },
            )
          ]
      ),
    );
  }
}









