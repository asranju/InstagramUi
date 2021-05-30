import 'dart:io';

import 'package:connectivity/connectivity.dart';

class NetWorkCheck {
  static Future<bool> checknetWorkStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
