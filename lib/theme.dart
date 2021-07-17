import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;

  static var lightTheme;
  static var darkTheme;

  ThemeMode get currentThem{
    return _isDarkTheme ? ThemeMode.dark : ThemeMode.light ;
  }
  toggleTheme(){
    _isDarkTheme =! _isDarkTheme;
    notifyListeners() ;
  }
}
 ThemeData get lightTheme {
  return ThemeData(
      primaryColor: Colors.lightBlue ,
      backgroundColor: Colors.white ,
   );
  }
 ThemeData get darkTheme{
  return ThemeData(

    primaryColor: Colors.black ,
    accentColor: Colors.red,
    scaffoldBackgroundColor: Colors.black,
    bottomSheetTheme:BottomSheetThemeData(
      backgroundColor: Colors.black,
    ),
  );
}
CustomTheme currentThem = CustomTheme() ;
