import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = "Wow";
    } else if (resultScore <= 12) {
      resultText = "Nice";
    } else if (resultScore <= 20) {
      resultText = "Strange";
    } else {
      resultText = "Bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text("Restart Quiz"),
            style: TextButton.styleFrom(foregroundColor: Colors.amber),
          )
        ],
      ),
    );
  }
}
