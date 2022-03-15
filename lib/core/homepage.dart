// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:romjan_protidin/core/customWidget/appbar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var date;
  var month;
  var year;

  @override
  void initState() {
    super.initState();
    getDate();
  }

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
            //
            Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFF00B563),
                          border: Border(
                              left: BorderSide(color: Colors.white, width: 2),
                              right:
                                  BorderSide(color: Colors.white, width: 2))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${date}-${month}-${year}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            Text("${date}-${month}-${year}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ],
                        ),
                      )),
                )),
            Expanded(
                flex: 3,
                child: Center(
                    child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFF00B563),
                      border: Border(
                          left: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2))),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6, left: 6),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 33,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text("সন্ধা ৬:১৭ মিনিট",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 27)),
                                ),
                                Container(
                                  color: Colors.red,
                                  width: responsive_width / 1,
                                  height: 38,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                width: responsive_width / 70,
                                color: Color(0xFF00B563)),
                          ),
                          Expanded(
                            flex: 33,
                            child: Column(
                              children: [
                                Text("সাহরী"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ))),
            Expanded(
                flex: 13,
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

  getDate() async {
    var datetime = DateTime.now();

    setState(() {
      date = datetime.day;
      year = datetime.year;
      month = datetime.month;
    });
  }
}
