// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables
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
      backgroundColor: Color(0xFF647AFF),
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
                          color: Color(0xFF647AFF),
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
                      color: Color(0xFF647AFF),
                      border: Border(
                          left: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2))),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6, left: 6),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.45),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Flexible(
                                        child: Text("রাত ৬:১৭ মিনিট",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    responsive_width / 35)),
                                      ),
                                    )),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    color: Colors.white.withOpacity(0.3),
                                    width: responsive_width / 1,
                                    height: 38,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Flexible(
                                            child: Text("সাহরী",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                    fontSize: 17)),
                                          )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                width: responsive_width / 70,
                                color: Color(0xFF647AFF)),
                          ),
                          Expanded(
                            flex: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Flexible(
                                      child: Text("সন্ধা ৬:১৭ মিনিট",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: responsive_width / 35)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    color: Colors.white.withOpacity(0.3),
                                    width: responsive_width / 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Flexible(
                                            child: Text("ইফতার",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17)),
                                          )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
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
                      color: Color(0xFF647AFF),
                      border: Border(
                          left: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2))),
                ))),
            Expanded(
                flex: 2,
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF647AFF),
                      border: Border(
                          left: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2))),
                ))),
            Expanded(
                flex: 2,
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF647AFF),
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
