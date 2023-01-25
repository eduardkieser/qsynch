import 'dart:ui';

class AppStateSingleton {
  static final AppStateSingleton _singleton = AppStateSingleton._internal();

  bool menu_open = false;

  factory AppStateSingleton() {
    return _singleton;
  }

  AppStateSingleton._internal();

  List<VoidCallback> _listeners = [];

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void notifyListeners() {
    _listeners.forEach((listener) => listener());
  }
}
