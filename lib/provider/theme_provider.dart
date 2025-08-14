import 'package:flutter/cupertino.dart';

class ThemeProvider with ChangeNotifier{
  Brightness _brightness = Brightness.light;
  Brightness get brightness => _brightness;

  void toggleBrightness(){
    _brightness = _brightness == Brightness.light ? Brightness.dark : Brightness.light;
    notifyListeners();
  }

  void setBrightness(Brightness value){
    _brightness = value;
    notifyListeners();
  }
}