// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_local_variable
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:romjan_protidin/core/appfunctions.dart';
import 'package:romjan_protidin/core/customWidget/appbar.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var date;
  bool savedata = true;
  var month;
  var year;
  var seheritime;
  var iftertime;
  var fajartime;
  var assartime;
  var johortime;
  var magribtime;
  var eshatime;
  var sunset;
  var sunrise;
  var locationvalue;
  var nias;
  var arabicmonth;
  var arabicdatenum;
  var arabicyear;
  var _selectedIndex = 0;
  var location = 'dhaka';
  bool closetime = true;
  bool loading = true;
  int selectedvalue = 1;
  var iftertimehours = DateTime.now().second - 6;
  var iftertimemin = DateTime.now().minute - 14;
  var iftertimesec = 60 - DateTime.now().second;
  var lefthour, leftmin, leftsec;
  bool doubledigitsec = true;
  bool doubledigitmin = true;
  bool doubledigitsours = true;
  late PageController _pageController;

  numberTranslator banglanumber = numberTranslator();
  banglamonth banglamonthname = banglamonth();
  @override
  void initState() {
    super.initState();
    PageController _pageController;
    arabicgetdate();
    getDate();
    checkexitdata();
    Customcountdown();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var responsive_height = MediaQuery.of(context).size.height;
    var responsive_width = MediaQuery.of(context).size.height;
    var widgetlist = [
      Container(
        color: Color(0xFF647AFF),
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
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  "${banglanumber.banglanum(date.toString())} ${banglamonthname.month(month.toString())} ${banglanumber.banglanum(year.toString())}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: responsive_width / 45)),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                  DropdownButton(
                                    dropdownColor: Colors.transparent,
                                    icon: SizedBox.shrink(),
                                    underline: SizedBox.shrink(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: responsive_width / 40),
                                    value: selectedvalue,
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
                                      var prefer =
                                          await SharedPreferences.getInstance();
                                      setState(() {
                                        selectedvalue = value!;
                                        prefer.setInt('locationvalue', value);
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
                )),
            Expanded(
                flex: 5,
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
                                        child: Text(
                                            "রাত ${banglanumber.banglanum(seheritime[1].toString())} মিনিট",
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
                                      child: Text(
                                          "সন্ধা ${banglanumber.banglanum(iftertime[1].toString())} মিনিট",
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
                flex: 2,
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF647AFF),
                      border: Border(
                          left: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2))),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: responsive_height / 45,
                        ),
                        Expanded(
                            flex: 1,
                            child: closetime
                                ? Text(
                                    'ইফাতারের সময় হতে বাকি আছে-\n\n\n',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: responsive_width / 43),
                                  )
                                : Text(
                                    'সেহরির সময় বাকি আছে-',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: responsive_width / 43),
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
                        decoration: BoxDecoration(
                          color: Color(0xFF647AFF),
                        ),
                        child: Center(
                            child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xFF647AFF),
                              border: Border(
                                  left:
                                      BorderSide(color: Colors.white, width: 2),
                                  right: BorderSide(
                                      color: Colors.white, width: 2))),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 6, left: 6),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.45),
                              ),
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
                                              child: Flexible(
                                                child: Text(
                                                    "${doubledigitsours ? "0$lefthour" : lefthour}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            responsive_width /
                                                                29)),
                                              ),
                                            )),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            width: responsive_width / 1,
                                            height: 38,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Flexible(
                                                    child: Text("ঘন্টা",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Flexible(
                                              child: Text(
                                                  "${doubledigitmin ? "0$leftmin" : leftmin}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          responsive_width /
                                                              29)),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            width: responsive_width / 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Flexible(
                                                    child: Text("মিনিট",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Flexible(
                                              child: Text(
                                                  '${doubledigitsec ? "0$leftsec" : leftsec}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          responsive_width /
                                                              29)),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            width: responsive_width / 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Flexible(
                                                    child: Text("সেকেন্ড",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
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
                        ))))),
            //namaj

            //
            Expanded(
                flex: 2,
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF647AFF),
                      border: Border(
                          left: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2))),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              width: responsive_width / 70,
                              color: Color(0xFF647AFF)),
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
                  decoration: BoxDecoration(
                    color: Color(0xFF647AFF),
                    border: Border(
                        left: BorderSide(color: Colors.white, width: 2),
                        right: BorderSide(color: Colors.white, width: 2)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
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
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("ফজর",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text(
                                                  "${banglanumber.banglanum(fajartime[1].toString())} পূর্বাহ্ণ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("فجر",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("জোহর",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text(
                                                  "${banglanumber.banglanum(johortime[1].toString())} অপরাহ্ণ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("ظهر",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("আসর",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text(
                                                  "${banglanumber.banglanum(assartime[1].toString())} অপরাহ্ণ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("ظهر",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("মাগরিব",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text(
                                                  "${banglanumber.banglanum(iftertime[1].toString())} অপরাহ্ণ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("مغرب",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("ইশা",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text(
                                                  "${banglanumber.banglanum(eshatime[1].toString())} অপরাহ্ণ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("عشاء",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("সূর্যোদয়",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text(
                                                  "${banglanumber.banglanum(seheritime[1].toString())} পূর্বাহ্ণ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("ظهر",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("সূর্যাস্ত",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(.3)))),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text(
                                                  "${banglanumber.banglanum(sunset[1].toString())} অপরাহ্ণ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          responsive_width /
                                                              47))),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(
                                              child: Text("فجر",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
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
        ),
      ),
      // ignore: avoid_unnecessary_containers
      Container(
        child: Center(child: Text("$_selectedIndex")),
      ),
      // ignore: avoid_unnecessary_containers
      Container(
        child: Center(child: Text("$_selectedIndex")),
      ),
      // ignore: avoid_unnecessary_containers
      Container(
        child: Center(child: Text("$_selectedIndex")),
      ),
    ];
    return Scaffold(
        bottomNavigationBar: BottomNavyBar(
          iconSize: 28,
          backgroundColor: Color(0xFF647AFF),
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Colors.white,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Users'),
                activeColor: Colors.white),
            BottomNavyBarItem(
                icon: Icon(Icons.message),
                title: Text('Messages'),
                activeColor: Colors.white),
            BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: Colors.white),
          ],
        ),
        backgroundColor: Color(0xFF647AFF),
        appBar: CustomAppBar(),
        body: Padding(
            padding: const EdgeInsets.all(1.0),
            child: SafeArea(
              child: widgetlist[_selectedIndex],
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
    });
  }

  checkexitdata() async {
    var prefer = await SharedPreferences.getInstance();
    setState(() {
      var locationvaluefn = prefer.getInt('locationvalue')!;
      locationvalue = locationvaluefn;
      selectedvalue = locationvaluefn;
      if (locationvaluefn == null) {
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
  }

  Customcountdown() async {
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
      await Future.delayed(Duration(seconds: 1));
      if (lefthour == 0) {
        break;
      }
    }
  }
}
