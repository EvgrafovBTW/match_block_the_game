import 'dart:async';
import 'dart:math';

class TitleStream {
  // int a = 0;
  List<String> titles = [];

  // stream({required int newVal}) async {
  //   a = newVal;
  //   Duration interval = Duration(seconds: 5);
  //   Stream<int> titleStream = Stream<int>.periodic(interval, callback);
  //   await for (int i in titleStream) {
  //     print(i);
  //   }
  // }

  // int callback(int val) {
  //   return val + a;
  // }
  // final _onNewTitle = StreamController<String>();
  // addToStream({required String value}) {
  //   _onNewTitle.sink.add(value);
  // }

  // Stream<String> get onNewtitle => _onNewTitle.stream;

  // stream({required List<String> tt}) async {
  //   titles = tt;
  //   Duration interval = Duration(seconds: 1);
  //   Stream<int> titleStream = Stream<int>.periodic(interval, callback);
  //   titleStream = titleStream.take(titles.length);
  //   await for (int t in titleStream) {
  //     print(titles[t]);
  //   }
  // }

  // int callback(int val) {
  //   return val;
  // }

  // String callbacdk(String val) {
  //   return titles.last;
  // }
//   stream() {
//     Duration interval = Duration(seconds: 2);
//   }

  // Stream<String> setTitle(List<String> titles) async* {
  //   for (String t in titles) {
  //     yield t;
  //     await Future.delayed(Duration(seconds: 2));
  //   }
  // }
}

class TitleCreator {
  TitleCreator() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      _controler.sink.add(_count);
      _count++;
    });
  }
  var _count = 1;
  final _controler = StreamController<int>();
  Stream<int> get stream => _controler.stream;
}

class TestStream {
  String toAdd;
  TestStream({required this.toAdd});
  Stream<String> getRandom({required List<String> t}) async* {
    var rendom = Random();
    int i = 0;
    while (i < t.length) {
      await Future.delayed(Duration(seconds: 1));
      yield t[i];
      i++;
    }
  }
}
