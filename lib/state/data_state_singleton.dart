class DataStateSingleton {
  static final DataStateSingleton _singleton = DataStateSingleton._internal();

  bool epoch_only = true;

  Map additional_data = {};

  void addData(String key, String value) {
    additional_data[key] = value;
  }

  void removeData(String key) {
    additional_data.remove(key);
  }

  String createDataString() {
    String millisecondsSinceEpoch =
        DateTime.now().millisecondsSinceEpoch.toString();

    if (epoch_only) {
      return millisecondsSinceEpoch;
    } else {
      Map dataWithTimestamp = {...additional_data};
      dataWithTimestamp["timestamp"] = millisecondsSinceEpoch;
      return dataWithTimestamp.toString();
    }
  }

  factory DataStateSingleton() {
    return _singleton;
  }

  DataStateSingleton._internal();
}
