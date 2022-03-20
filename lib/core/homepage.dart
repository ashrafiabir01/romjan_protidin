// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:romjan_protidin/core/appfunctions.dart';
import 'package:romjan_protidin/core/customWidget/appbar.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var date;
  var month;
  var year;
  var seheritime;
  var iftertime;
  bool closetime = true;
  bool loading = true;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  int _value = 1;
  numberTranslator banglanumber = numberTranslator();
  banglamonth banglamonthname = banglamonth();
  @override
  void initState() {
    super.initState();
    getDate();
    DataScraper();
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
                                    value: _value,
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
                                      setState(() {
                                        _value = value!;
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
                                  "${banglanumber.banglanum(date.toString())} ${banglamonthname.month(month.toString())} ${banglanumber.banglanum(year.toString())}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: responsive_width / 44)),
                            ],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Flexible(
                                        child: Text(
                                            "সন্ধা ${banglanumber.banglanum(iftertime[1].toString())} মিনিট",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    responsive_width / 35)),
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
                                    left: BorderSide(
                                        color: Colors.white, width: 2),
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
                                                  child: Text("00",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              responsive_width /
                                                                  35)),
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
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.black,
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
                                              padding: const EdgeInsets.only(
                                                  top: 16),
                                              child: Flexible(
                                                child: Text("00",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            responsive_width /
                                                                35)),
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
                                                                  FontWeight
                                                                      .w400,
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
                                              padding: const EdgeInsets.only(
                                                  top: 16),
                                              child: Flexible(
                                                child: Text('00',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            responsive_width /
                                                                35)),
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
                                                                  FontWeight
                                                                      .w400,
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
                                            color:
                                                Colors.white.withOpacity(0.6))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.6))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.6))),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.3))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.3))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.3))),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.6))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.6))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.6))),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.3))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.3))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.3))),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: Colors.white.withOpacity(0.6),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.6))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.6))),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.3))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.3))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.3))),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                              color: Colors.white
                                                  .withOpacity(0.6))),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                              color: Colors.white
                                                  .withOpacity(0.6))),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                              color: Colors.white
                                                  .withOpacity(0.6))),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ))),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF647AFF),
                      border: Border(
                          bottom: BorderSide(color: Colors.white, width: 2),
                          left: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2))),
                  child: Center(
                    child: Container(
                      width: responsive_width / 2.8,
                      height: responsive_height / 18,
                      child: ElevatedButton(
                        onHover: (value) => {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white.withOpacity(0.3),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            "রমজানের পূরনাঙ্গ সময়সূচী",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: responsive_width / 44),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ));
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
      "https://isubqo.com/fasting-time/bangladesh/dhaka/dhaka",
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
      var len = nais.length;
    });
  }
}
