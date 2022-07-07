import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:survey_pmdd/screens/EMApm_next.dart';

class Boardpm extends StatefulWidget {
  const Boardpm({super.key});

  @override
  State<Boardpm> createState() => _BoardpmState();
}

class _BoardpmState extends State<Boardpm> {
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
              '지금부터 자기 전까지 예상되는 기분/느낌을',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
              ),
            Text(
              '다음에 제시될 6가지 측면에서',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
              ),
            Text(
              '점수를 매겨주세요',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
              ),
            MaterialButton(
                color: Colors.redAccent[100],
                splashColor: Colors.red[100],
                child: Text("계속"),
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EMApmNext()));
                })
          ]),
        ),
      ),
    );
  }
}
