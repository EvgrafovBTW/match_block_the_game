class TitleStream {
  stream() async {
    Duration interval = Duration(seconds: 7);
    Stream<int> titleStream = Stream<int>.periodic(interval, callback);
    await for (int i in titleStream) {
      return i;
    }
  }

  int callback(int val) {
    return (val + 1) * 2;
  }
}
