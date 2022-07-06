import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_questions/conditional_questions.dart';

import 'resources.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:survey_pmdd/model/api_sheets.dart';

import 'package:survey_pmdd/cal_screen.dart';

class NextSurv_w2 extends StatelessWidget {
  const NextSurv_w2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Weekly Checklist'),
      ),
      body: MyNextSurv_w2(),
    );
  }
}

class MyNextSurv_w2 extends StatefulWidget {
  const MyNextSurv_w2({Key? key}) : super(key: key);

  @override
  _MyNextSurv_w2State createState() => _MyNextSurv_w2State();
}

class _MyNextSurv_w2State extends State<MyNextSurv_w2> {

  final _key = GlobalKey<QuestionFormState>();
  late final _firestream;
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
    _firestream =
        FirebaseFirestore.instance.collection('weekly').doc(inputData()).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConditionalQuestions(
          key: _key,
          children: questions2_3(),
          trailing: [
            MaterialButton(
              color: Colors.redAccent[100],
              splashColor: Colors.red[100],
              child: Text("제출"),
              onPressed: () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CalScreen())
                );
                await SurvSheetsApi.insertW2(_key.currentState!.toMap());

              },
            )
          ]
      ),
    );
  }
}









