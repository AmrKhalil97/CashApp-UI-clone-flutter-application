// import 'package:shared_preferences/shared_preferences.dart';
//
// class CacheHelper{
//
//  static late SharedPreferences sharedPreferences;
//
// static init()async{
// sharedPreferences= await SharedPreferences.getInstance();
// }
//
//  // CacheHelper.init().then((value) {print('CacheHelper Initialize');});
//  static Future<bool> putData({required String key,required String value})async{
//  return await sharedPreferences.setString(key, value);
// }
//
//  static Future<bool> putDouble({required String key,required double value})async{
//   return await sharedPreferences.setDouble(key, value);
//  }
//  static Future<bool> putList({required String key,required List<String> value})async{
//   return await sharedPreferences.setStringList(key, value);
//  }
//
//  static Future<bool> addString({required String x})async{
//   var value =CacheHelper.getList(key: 'subList');
//    value?.add(x);
//    var done=value;
//   return await sharedPreferences.setStringList('subList',done!);
//  }
//
//  static String? getData({
//    required String key
//  }){
//    return  sharedPreferences.getString(key);
//  }
//  static double? getDouble({
//   required String key
//  }){
//   return  sharedPreferences.getDouble(key);
//  }
//  static List<String>? getList({
//   required String key
//  }){
//   return  sharedPreferences.getStringList(key);
//  }
//
//  static clear(String key){
//   return sharedPreferences.remove(key);
//  }
//
// }
//
