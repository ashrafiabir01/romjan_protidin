// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:romjan_protidin/core/appfunctions.dart';
import 'package:romjan_protidin/core/customWidget/appbar.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restart_app/restart_app.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var date;
  late bool savedata = true;
  late var month;
  late var year;
  late var seheritime = ['00', '00', '00'];
  late var iftertime = ['00', '00', '00'];
  late var fajartime = ['00', '00', '00'];
  late var assartime = ['00', '00', '00'];
  int value = 0;
  bool itsehertime = true;
  var tempcheck;
  var dt = DateTime.now();
  late var johortime = ['00', '00', '00'];
  late var magribtime = ['00', '00', '00'];
  late var eshatime = ['00', '00', '00'];
  late var sunset = ['00', '00', '00'];
  late var sunrise = ['00', '00', '00'];
  late var locationvalue;
  late var nias = ['00', '00', '00'];
  late var arabicmonth = "00";
  int tempvalue2 = 1;
  late var arabicdatenum = "00";
  late var arabicyear = "00";
  late var location = 'dhaka';
  bool closetime = true;
  var showdia = 0;
  bool loading = true;
  int selectedvalue = 1;
  var tempdata = 0;
  var iftertimehours = 4;
  var iftertimemin = 06;
  var iftertimesec = 60;
  var lefthour, leftmin, leftsec;
  bool doubledigitsec = true;
  bool doubledigitmin = true;
  late bool doubledigitsours = true;

  numberTranslator banglanumber = numberTranslator();
  banglamonth banglamonthname = banglamonth();

  @override
  void initState() {
    super.initState();

    arabicgetdate();
    getDate();
    checkexitdata();
    customcountdown();
    Timer(Duration(seconds: 2), () {
      if (tempdata == 0) {
        showDalogchoice();
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    var responsive_height = MediaQuery.of(context).size.height;
    var responsive_width = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: const Color(0xFF647AFF),
        appBar: CustomAppBar(),
        body: Padding(
            padding: const EdgeInsets.all(1.0),
            child: SafeArea(
              child: loading == false
                  ? Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                              child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF647AFF),
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.white, width: 2),
                                    right: BorderSide(
                                        color: Colors.white, width: 2))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                      "${banglanumber.banglanum(date.toString())} ${banglamonthname.month(month.toString())} ${banglanumber.banglanum(year.toString())}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: responsive_width / 45)),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                      ),
                                      DropdownButton(
                                        dropdownColor: Colors.transparent,
                                        icon: const SizedBox.shrink(),
                                        underline: const SizedBox.shrink(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: responsive_width / 40),
                                        value: selectedvalue,
                                        items: const [
                                          DropdownMenuItem(
                                            child: Text("ঢাকা"),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("সিলেট"),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("রংপুর"),
                                            value: 3,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("চট্টগ্রাম"),
                                            value: 4,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("বরিশাল"),
                                            value: 5,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("খুলনা"),
                                            value: 6,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("রাজশাহী"),
                                            value: 7,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("ময়মনসিংহ"),
                                            value: 8,
                                          ),
                                        ],
                                        onChanged: (int? value) async {
                                          SharedPreferences prefer;
                                          prefer = await SharedPreferences
                                              .getInstance();
                                          await SharedPreferences.getInstance();
                                          setState(() {
                                            selectedvalue = value!;
                                            prefer.setInt(
                                                'locationvalue', value);
                                            prefer.setInt('lo', 1);
                                          });
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  elevation: 0,
                                                  backgroundColor: Colors.blue,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              elevation: 0),
                                                      onPressed: () async {
                                                        await Restart
                                                            .restartApp();
                                                      },
                                                      child: SizedBox(
                                                        width:
                                                            responsive_width /
                                                                5,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          // ignore: prefer_const_literals_to_create_immutables
                                                          children: [
                                                            Icon(
                                                              Icons.restart_alt,
                                                              size:
                                                                  responsive_width /
                                                                      29,
                                                            ),
                                                            Text(
                                                              'রিস্টার্ট অ্যাপ',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      responsive_width /
                                                                          45),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                );
                                              });
                                        },
                                      ),

                                      // Text("শেরপুর",
                                      //     style: TextStyle(
                                      //         color: Colors.white,
                                      //         fontWeight: FontWeight.bold,
                                      //         fontSize: responsive_width / 40)),
                                    ],
                                  ),
                                  Text(
                                      "${banglanumber.banglanum(arabicdatenum.toString())}${banglanumber.banglanum(arabicmonth.toString())}${banglanumber.banglanum(arabicyear.toString())}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: responsive_width / 44)),
                                ],
                              ),
                            ),
                          )),
                        ),
                        Expanded(
                            flex: 5,
                            child: Center(
                                child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF647AFF),
                                  border: Border(
                                      left: BorderSide(
                                          color: Colors.white, width: 2),
                                      right: BorderSide(
                                          color: Colors.white, width: 2))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 6, left: 6),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.45),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 50,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16),
                                                child: Text(
                                                    "রাত ${banglanumber.banglanum(seheritime[1].toString())} মিনিট",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            responsive_width /
                                                                35)),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                color: Colors.white
                                                    .withOpacity(0.3),
                                                width: responsive_width / 1,
                                                height: 38,
                                                child: const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text("সাহরী",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black,
                                                            fontSize: 17)),
                                                  ),
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
                                            color: const Color(0xFF647AFF)),
                                      ),
                                      Expanded(
                                        flex: 50,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16),
                                                child: Text(
                                                    "সন্ধা ${banglanumber.banglanum(iftertime[1].toString())} মিনিট",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            responsive_width /
                                                                35)),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                color: Colors.white
                                                    .withOpacity(0.3),
                                                width: responsive_width / 1,
                                                child: const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text("ইফতার",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 17)),
                                                  ),
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
                            flex: 2,
                            child: Center(
                                child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xFF647AFF),
                                  border: Border(
                                      left: BorderSide(
                                          color: Colors.white, width: 2),
                                      right: BorderSide(
                                          color: Colors.white, width: 2))),
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: responsive_height / 45,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: itsehertime
                                            ? Text(
                                                'সেহরির সময় বাকি আছে -\n\n\n',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        responsive_width / 43),
                                              )
                                            : Text(
                                                'ইফাতারের সময় বাকি আছে -',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        responsive_width / 43),
                                              ))
                                  ],
                                ),
                              ),
                            ))),

//

//Countdown
//
                        Expanded(
                            flex: 4,
                            child: Center(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF647AFF),
                                    ),
                                    child: Center(
                                        child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF647AFF),
                                          border: Border(
                                              left: BorderSide(
                                                  color: Colors.white,
                                                  width: 2),
                                              right: BorderSide(
                                                  color: Colors.white,
                                                  width: 2))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 6, left: 6),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.45),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 50,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 5,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 16),
                                                        child: Text(
                                                            "${doubledigitsours ? "0$lefthour" : lefthour}",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    responsive_width /
                                                                        29)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                        width:
                                                            responsive_width /
                                                                1,
                                                        height: 38,
                                                        child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                  "ঘন্টা",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          17)),
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                    width:
                                                        responsive_width / 70,
                                                    color: const Color(
                                                        0xFF647AFF)),
                                              ),
                                              Expanded(
                                                flex: 50,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 5,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 16),
                                                        child: Text(
                                                            "${doubledigitmin ? "0$leftmin" : leftmin}",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    responsive_width /
                                                                        29)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                        width:
                                                            responsive_width /
                                                                1,
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text("মিনিট",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17)),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                    width:
                                                        responsive_width / 70,
                                                    color: const Color(
                                                        0xFF647AFF)),
                                              ),
                                              Expanded(
                                                flex: 50,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 5,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 16),
                                                        child: Text(
                                                            '${doubledigitsec ? "0$leftsec" : leftsec}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    responsive_width /
                                                                        29)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                        width:
                                                            responsive_width /
                                                                1,
                                                        child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                  "সেকেন্ড",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          17)),
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))))),
                        //namaj

                        //
                        Expanded(
                            flex: 2,
                            child: Center(
                                child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xFF647AFF),
                                  border: Border(
                                      left: BorderSide(
                                          color: Colors.white, width: 2),
                                      right: BorderSide(
                                          color: Colors.white, width: 2))),
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          width: responsive_width / 70,
                                          color: const Color(0xFF647AFF)),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          'আজকের নামাজের সময়সূচী',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: responsive_width / 43),
                                        ))
                                  ],
                                ),
                              ),
                            ))),
                        Expanded(
                            flex: 13,
                            child: Center(
                                child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF647AFF),
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.white, width: 2),
                                    left: BorderSide(
                                        color: Colors.white, width: 2),
                                    right: BorderSide(
                                        color: Colors.white, width: 2)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text("ফজর",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text(
                                                              "${banglanumber.banglanum(fajartime[1].toString())} পূর্বাহ্ণ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.6),
                                                    ),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text("فجر",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          40))),
                                                    ),
                                                  )),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text("জোহর",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text(
                                                              "${banglanumber.banglanum(johortime[1].toString())} অপরাহ্ণ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.3),
                                                    ),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text("ظهر",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          40))),
                                                    ),
                                                  )),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text("আসর",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text(
                                                              "${banglanumber.banglanum(assartime[1].toString())} অপরাহ্ণ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.6),
                                                    ),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text("عصر",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          40))),
                                                    ),
                                                  )),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text("মাগরিব",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text(
                                                              "${banglanumber.banglanum(iftertime[1].toString())} অপরাহ্ণ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.3),
                                                    ),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text("مغرب",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          40))),
                                                    ),
                                                  )),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text("ইশা",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text(
                                                              "${banglanumber.banglanum(eshatime[1].toString())} অপরাহ্ণ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.6),
                                                    ),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text("عشاء",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          40))),
                                                    ),
                                                  )),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text(
                                                              "সূর্যোদয়",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text(
                                                              "${banglanumber.banglanum(seheritime[1].toString())} পূর্বাহ্ণ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.3),
                                                    ),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text("طلوع",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          40))),
                                                    ),
                                                  )),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text(
                                                              "সূর্যাস্ত",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .3)))),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text(
                                                              "${banglanumber.banglanum(sunset[1].toString())} অপরাহ্ণ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          47))),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.6),
                                                    ),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Center(
                                                          child: Text("غروب",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      responsive_width /
                                                                          40))),
                                                    ),
                                                  )),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ))),
                      ],
                    )
                  : Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.white, width: 2),
                              left: BorderSide(color: Colors.white, width: 2),
                              right:
                                  BorderSide(color: Colors.white, width: 2))),
                      child: Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ),
                    ),
            )));
  }

  getDate() async {
    var datetime = DateTime.now();

    setState(() {
      date = datetime.day;
      year = datetime.year;
      month = datetime.month;
    });
  }

  DataScraper() async {
    try {
      final response = await http.Client().get(Uri.parse(
        "https://isubqo.com/fasting-time/bangladesh/${location.toString()}",
      ));
      var document = parser.parse(response.body);

      setState(() {
        var responseString1 = document
            .getElementsByClassName("namaz-time-view")[0]
            .children[0]
            .children[0];
        var nais = responseString1.text.trim();
        seheritime = nais.split(' ');

        var responseString2 = document
            .getElementsByClassName("namaz-time-view")[0]
            .children[0]
            .children[1];
        var nais2 = responseString2.text.trim();
        iftertime = nais2.split(' ');
        var seheritimeinthour = seheritime[1].split(':')[0];
        var seheritimeinthour1 = seheritime[1].split(':')[1];
        var seheritimeinthour3 = seheritime[1].split(':')[0];
        var seheritimeinthour4 = seheritime[1].split(':')[1];
        var iftertimehour = iftertime[1].split(':')[0];
        var iftertimehour1 = iftertime[1].split(':')[1];
        var leftiftertimetemp = (int.parse(iftertimehour) + 12) * 3600 +
            int.parse(iftertimehour1) * 60;
        var leftseheritimetemp = (int.parse(seheritimeinthour)) * 3600 +
            int.parse(seheritimeinthour1) * 60;
        var leftseheritimetemp2 = (int.parse(seheritimeinthour3) + 12) * 3600 +
            int.parse(seheritimeinthour4) * 60;
        var nowtimesec =
            DateTime.now().hour * 3600 + DateTime.now().minute * 60;

        var value = leftseheritimetemp - nowtimesec;
        var value2 = leftiftertimetemp - nowtimesec;
        var value3 = leftseheritimetemp2 - nowtimesec;
        int h, m, se;
        int h2, m2, se2;
        int h3, m3, se3;
        h = value ~/ 3600;

        m = ((value - h * 3600)) ~/ 60;

        se = value - (h * 3600) - (m * 60);

        h2 = value2 ~/ 3600;

        m2 = ((value2 - h2 * 3600)) ~/ 60;

        se2 = value2 - (h2 * 3600) - (m2 * 60);

        h3 = value3 ~/ 3600;

        m3 = ((value3 - h3 * 3600)) ~/ 60;

        se3 = value3 - (h3 * 3600) - (m3 * 60);

        setState(() {
          if (h == 0 && m == 0) {
            itsehertime = false;
            iftertimehours = h2;
            iftertimemin = m2;

            iftertimesec = se2;
          } else if (DateTime.now().hour >= 19 && DateTime.now().hour <= 24) {
            itsehertime = true;
            iftertimehours = h3 + 12;
            iftertimemin = m3 + 60;
            iftertimesec = se3;
          } else if (h2 == 0 &&
              m2 == 0 &&
              DateTime.now().hour >= 0 &&
              DateTime.now().hour <= 5) {
            itsehertime = true;
            iftertimehours = h;
            iftertimemin = m;
            tempvalue2 = 0;
            iftertimesec = se;
          } else {
            itsehertime = false;
            iftertimehours = h2;
            iftertimemin = m2;

            iftertimesec = se2;
          }
        });
        var responseString3 = document
            .getElementsByClassName("namaz-time-view")[0]
            .children[0]
            .children[2];
        var nais3 = responseString3.text.trim();
        fajartime = nais3.split(' ');
        var responseString4 = document
            .getElementsByClassName("namaz-time-view")[0]
            .children[0]
            .children[3];
        var nais4 = responseString4.text.trim();
        johortime = nais4.split(' ');
        var responseString5 = document
            .getElementsByClassName("namaz-time-view")[0]
            .children[0]
            .children[4];
        var nais5 = responseString5.text.trim();
        assartime = nais5.split(' ');
        var responseString6 = document
            .getElementsByClassName("namaz-time-view")[0]
            .children[0]
            .children[5];
        var nais6 = responseString6.text.trim();
        magribtime = nais6.split(' ');
        var responseString7 = document
            .getElementsByClassName("namaz-time-view")[0]
            .children[0]
            .children[6];
        var nais7 = responseString7.text.trim();
        eshatime = nais7.split(' ');
        var responseString8 = document
            .getElementsByClassName("namaz-time-view")[0]
            .children[0]
            .children[7];
        var nais8 = responseString8.text.trim();
        sunrise = nais8.split(' ');
        var responseString9 = document
            .getElementsByClassName("namaz-time-view")[0]
            .children[0]
            .children[8];
        var nais9 = responseString9.text.trim();
        sunset = nais9.split(' ');
        if (nais9.length == 0) {
          setState(() {
            loading = true;
          });
        } else {
          setState(() {
            loading = false;
          });
        }
      });
    } catch (e) {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG,
          msg: 'Check your internet connection');
    }
  }

  checkexitdata() async {
    var prefer = await SharedPreferences.getInstance();
    var locationvaluefn = prefer.getInt('locationvalue');
    setState(() {
      locationvalue = locationvaluefn;
      selectedvalue = locationvaluefn!;
      tempdata = locationvaluefn;
      if (locationvaluefn == 0) {
        location = 'dhaka';
        DataScraper();
      } else if (locationvaluefn == 1) {
        location = 'dhaka';
        DataScraper();
      } else if (locationvaluefn == 2) {
        location = 'silhat';
        DataScraper();
      } else if (locationvaluefn == 3) {
        location = 'rangpur';
        DataScraper();
      } else if (locationvaluefn == 4) {
        location = 'chattagam';
        DataScraper();
      } else if (locationvaluefn == 5) {
        location = 'barisal';
        DataScraper();
      } else if (locationvaluefn == 6) {
        location = 'khulna';
        DataScraper();
      } else if (locationvaluefn == 7) {
        location = 'rajshahi';
        DataScraper();
      } else if (locationvaluefn == 8) {
        location = 'maimansingh';
        DataScraper();
      } else {
        location = 'dhaka';
        DataScraper();
      }
    });
  }

  arabicgetdate() async {
    await Future.delayed(Duration(milliseconds: 50));

    try {
      final response = await http.Client()
          .get(Uri.parse('https://isubqo.com/islamic-calendar'));
      var document = parser.parse(response.body);
      setState(() {
        var responsedata = document.getElementsByClassName('text-right')[0];
        var arabidatedata = responsedata.text.trim().split('.');
        arabicmonth = arabidatedata[1];
        arabicyear = arabidatedata[2];
        var splitdatetry = arabidatedata[0].split(':');
        arabicdatenum = splitdatetry[1];

        if (arabicmonth == " Sha'ban") {
          arabicmonth = ' শা’বান';
        } else if (arabicmonth == " Ramadan") {
          arabicmonth = 'রামাজান';
        } else if (arabicmonth == " Shawwal") {
          arabicmonth = 'শাওয়াল';
        } else {
          arabicmonth = arabicmonth;
        }
      });
    } catch (e) {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG,
          msg: 'Check your internet connection');
    }
  }

  customcountdown() async {
    setState(() {});

    for (int i = iftertimesec; i >= 0; i--) {
      setState(() {
        doubledigitmin = false;
        doubledigitsec = false;
        doubledigitsours = false;
        leftsec = iftertimesec;
        leftmin = iftertimemin;
        lefthour = iftertimehours;
        leftsec = i;
        if (i == 0) {
          i = 60;
          iftertimemin = iftertimemin - 1;
          leftmin = iftertimemin;
        }
        if (leftsec.toString().length == 1) {
          doubledigitsec = !doubledigitsec;
        }
        if (leftmin.toString().length == 1) {
          doubledigitmin = !doubledigitmin;
        }
        if (lefthour.toString().length == 1) {
          doubledigitsours = !doubledigitsours;
        }
        if (iftertimemin == 0) {
          iftertimemin = 60;
          iftertimehours = iftertimehours - 1;
          lefthour = iftertimehours;
        }
      });
      await Future.delayed(const Duration(seconds: 1));
      if (lefthour == 0) {
        break;
      }
    }
  }

  showDalogchoice() async {
    await Future.delayed(Duration(milliseconds: 50));
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return WillPopScope(
              onWillPop: () => Future.value(false),
              child: Dialog(
                backgroundColor: Colors.blue,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.height / 7,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('নির্বাচন করুন',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            DropdownButton(
                              dropdownColor: Colors.transparent,
                              icon: const SizedBox.shrink(),
                              underline: const SizedBox.shrink(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30),
                              value: selectedvalue,
                              // ignore: prefer_const_literals_to_create_immutables
                              items: [
                                DropdownMenuItem(
                                  child: Text("ঢাকা"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("সিলেট"),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                  child: Text("রংপুর"),
                                  value: 3,
                                ),
                                DropdownMenuItem(
                                  child: Text("চট্টগ্রাম"),
                                  value: 4,
                                ),
                                DropdownMenuItem(
                                  child: Text("বরিশাল"),
                                  value: 5,
                                ),
                                DropdownMenuItem(
                                  child: Text("খুলনা"),
                                  value: 6,
                                ),
                                DropdownMenuItem(
                                  child: Text("রাজশাহী"),
                                  value: 7,
                                ),
                                DropdownMenuItem(
                                  child: Text("ময়মনসিংহ"),
                                  value: 8,
                                ),
                              ],
                              onChanged: (int? value) async {
                                SharedPreferences prefer;
                                prefer = await SharedPreferences.getInstance();
                                setState(() {
                                  selectedvalue = value!;
                                  loading = false;
                                  prefer.setInt('locationvalue', value);
                                });

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        elevation: 0,
                                        backgroundColor: Colors.blue,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                elevation: 0),
                                            onPressed: () async {
                                              await Restart.restartApp();
                                            },
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  Icon(
                                                    Icons.restart_alt,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        29,
                                                  ),
                                                  Text(
                                                    'রিস্টার্ট অ্যাপ',
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            45),
                                                  )
                                                ],
                                              ),
                                            )),
                                      );
                                    });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
//finished 31 march 2022