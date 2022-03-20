class numberTranslator {
  String banglanum(var input) {
    var number_len = input.toString().length;
    var nais = '';
    var variable = '';
    for (int i = 0; i < number_len; i++) {
      if (input[i] == "3") {
        variable = "৩";
      } else if (input[i] == "1") {
        variable = "১";
      } else if (input[i] == "2") {
        variable = "২";
      } else if (input[i] == "4") {
        variable = "৪";
      } else if (input[i] == "5") {
        variable = "৫";
      } else if (input[i] == "6") {
        variable = "৬";
      } else if (input[i] == "7") {
        variable = "৭";
      } else if (input[i] == "8") {
        variable = "৮";
      } else if (input[i] == "9") {
        variable = "৯";
      } else if (input[i] == "0") {
        variable = "০";
      } else {
        variable = input[i];
      }
      nais = nais + variable;
    }
    return nais.toString();
  }
}

class banglamonth {
  String month(var monthdata) {
    var month = "";
    if (monthdata == "1") {
      month = "জানুয়ারি";
    } else if (monthdata == '2') {
      month = "ফেব্রুয়ারী";
    } else if (monthdata == '3') {
      month = "মার্চ";
    } else if (monthdata == '4') {
      month = "এপ্রিল";
    } else if (monthdata == '5') {
      month = "মে";
    } else if (monthdata == '6') {
      month = "জুন";
    } else if (monthdata == '7') {
      month = "জুলাই";
    } else if (monthdata == '8') {
      month = "আগষ্ট";
    } else if (monthdata == '9') {
      month = "সেপ্টেম্বর";
    } else if (monthdata == '10') {
      month = "অক্টোবর";
    } else if (monthdata == '11') {
      month = "নভেম্বর";
    } else if (monthdata == '12') {
      month = "ডিসেম্বর";
    } else {
      month == 'nais';
    }
    return month;
  }
}
