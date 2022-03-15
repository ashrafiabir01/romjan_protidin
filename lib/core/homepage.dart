// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:romjan_protidin/core/customWidget/appbar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var responsive_height = MediaQuery.of(context).size.height;
    var responsive_width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF00B563),
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: SafeArea(
            child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF00B563),
                      border: Border(
                          left: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2))),
                ))),
            Expanded(
                flex: 2,
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF00B563),
                      border: Border(
                          left: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2))),
                ))),
            Expanded(
                flex: 1,
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF00B563),
                      border: Border(
                          left: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2))),
                ))),
            Expanded(
                flex: 2,
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF00B563),
                      border: Border(
                          left: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2))),
                ))),
            Expanded(
                flex: 2,
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF00B563),
                      border: Border(
                          left: BorderSide(color: Colors.white, width: 2),
                          bottom: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2))),
                ))),
          ],
        )),
      ),
    );
  }
}
