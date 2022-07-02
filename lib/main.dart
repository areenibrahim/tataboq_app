// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text('تطابق صورة'),
          backgroundColor: Colors.indigo[800],
        ),
        body: ImagePage(),
      ),
    ),
  );
}

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = 1;
  int rightImageNumber = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNumber == rightImageNumber
              ? 'مبروك لقد نجحت'
              : 'حاول مرة أخرى',
          style: TextStyle(
            fontSize: 42.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftImageNumber = Random().nextInt(8) + 1;
                      rightImageNumber = Random().nextInt(8) + 1;
                    });
                  },
                  child: Image.asset('images/image-$leftImageNumber.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        rightImageNumber = Random().nextInt(8) + 1;
                        leftImageNumber = Random().nextInt(8) + 1;
                      });
                    },
                    child: Image.asset('images/image-$rightImageNumber.png')),
              ),
            ],
          ),
        )
      ],
    );
  }
}
