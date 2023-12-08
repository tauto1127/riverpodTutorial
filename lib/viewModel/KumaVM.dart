import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_tutorial/state/bearState.dart';
import 'dart:convert';

part 'KumaVM.g.dart';

@riverpod
class KumaVM extends _$KumaVM {
  //Future<>で囲って，後ろにasyncをつければAsyncValueになる
  @override
  Future<BearState> build() async{ 
///Future<>で囲うとAsyncValueになる
  ///stateをAsyncValueとして保持してます　これによってロード中，データ，エラーの三つの状態を扱えます．
  ///非同期関数についてわかりやすいサイト(Streamからは読まなくていい) -> https://zenn.dev/urasan/articles/f6613470658de1
  
  /// なぜこれにしたか
  /// 1. このアプリでは外部から画像を持ってくるので，この処理が時間がかかるから． -> ロード中にしたい
  /// 2. flutterはわからないけど，普通のアプリだったら，非同期関数を使わないと重い処理を待ってる間は画面がフリーズしてしまう．
    return BearState(
      width: 100, 
      height: 100,
    );
  }

  Future<void> getBearImg() async {
    //Uri url = Uri.https('placebear.com',"/$state.height/$state.width"); // placebear.com/200/200　にアクセスしてみて
    state.whenData((value) {// whenのdataだけ扱うバージョン．load状態，エラー状態は考慮しない valueにはBearStateが入る．
    try{ 
      state = const AsyncLoading(); //stateをロード状態にします．
      Uri url = Uri.https('placebear.com', "/${value.height}/${value.width}"); //画像をとってくるためのURLを生成 
      // placebear.com/200/200　こんな感じに生成される．
      /// commandキー + クリックでアクセス ---> https://placebear.com/200/200
      debugPrint(url.toString());
      Future<http.Response> response = http.get(url); //urlでアクセスして結果を受け取ってます　この辺の処理はそんな深く考えないでいい　あくまでriverpodの勉強だから
      response.then((res) {
        debugPrint("response 届いた"); //このdebugPrintを使う とデバッグコンソール(エラーとかが出る場所)に文字を出力できる
        state = AsyncData(value.copyWith(image: res.bodyBytes)); //imageを置き換えてる 25行目でstateにAsyncLoadingを設定したが，ここでAsyncDataに置き換えてる
      });
    }
    catch(_ClientSocketException) { //気にしなくていいよー　エラーが起きた時の処理を書いています．
      state.whenData((value) => state = AsyncValue.data(value.copyWith(errorText: "インターネットに接続できません")));
    }
    });
  }

  Future<void> setKumaState(int height, int width) async { //ここは昨日実装したとこ．別に非同期関数に変えなくてもいいよ (Future<> , async)つけなくていい
    state.when(///AsyncValueが．．．
      data: (data) { //AsyncDataの時
        debugPrint(data.height.toString());
        state = AsyncData(data.copyWith(height: height, width: width));
      },
      error: (_,__) => debugPrint("error"), //AsyncErrorの時
      loading: () => debugPrint("loadiggg") //AsyncLoadingの時
    );
  }

  void setErrorString(String text) {
    state.whenData((value) =>
      state = AsyncData(value.copyWith(errorText: text.toString()))
    );
  }

}