import 'package:shared_preferences/shared_preferences.dart';

class Data {
  static List<String> list = List.filled(15, '0');

  static Future<void> setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('data', list);

  }
  static Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    list = prefs.getStringList('data')!;
  }
  static Future<bool> check()  async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var a = prefs.getStringList('data');
    if(a == null){
      return true;
    }else{
      return false;
    }
  }
}
