import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'EMAam.dart';

class Boardam extends StatefulWidget {
  const Boardam({super.key});

  @override
  State<Boardam> createState() => _BoardamState();
}

class _BoardamState extends State<Boardam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 360,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(
              '현재 기분/느낌을',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              ),
            Text(
              '다음에 제시될 6가지 측면에서',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              ),
            Text('점수를 매겨주세요',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              ),
            MaterialButton(
                color: Colors.redAccent[100],
                splashColor: Colors.red[100],
                child: Text("계속"),
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EMAam()));
                })
          ]),
        ),
      ),
    );
  }
}
