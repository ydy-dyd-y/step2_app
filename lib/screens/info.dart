import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'resources.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:survey_pmdd/cal_screen.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('My Info'),
      ),
      body: MyInfo(),
    );
  }
}

class MyInfo extends StatefulWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  _MyInfo createState() => _MyInfo();
}

class _MyInfo extends State<MyInfo> {
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
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    var strToday = formatter.format(now);
    return strToday;
  }

  @override
  void initState() {
    super.initState();
    _firestream =
        FirebaseFirestore.instance.collection('info').doc(inputData()).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConditionalQuestions(
                key: _key,
                children: questions3(),
                trailing: [
                  MaterialButton(
                    color: Colors.redAccent[100],
                    splashColor: Colors.red[100],
                    child: Text("제출"),
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        print("validated!");
                        FirebaseFirestore.instance
                            .collection('info')
                            .doc(inputData())
                            .collection(getToday())
                            .add(_key.currentState!.toMap());
                      }
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => CalScreen()));
                    },
                  )
                ]
            )
    );
  }
}


