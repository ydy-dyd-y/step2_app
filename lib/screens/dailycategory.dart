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

import 'EMAam.dart';
import 'daily.dart';


class DailyCate extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Daily Checklist'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EMAam()));
              },
              child: Text("Morning Check"),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(240, 150), primary: Colors.lightBlueAccent[200], onPrimary: Colors.indigo,
                  textStyle: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Daily()));
              },
              child: Text("Evening Check"),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(240, 150), primary: Colors.indigo, onPrimary: Colors.lightBlueAccent, textStyle: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )
              ),
            ),
          ],
        ),
      )
    );
  }
}

