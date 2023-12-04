import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_tutorial/state/bearState.dart';
import 'dart:convert';

part 'KumaVM.g.dart';

@riverpod
class KumaVM extends _$KumaVM {
  @override
  Future<BearState> build() async{
    return BearState(
      width: 100, 
      height: 100,
    );
  }

  Future<void> getBearImg(int height, int width) async {
    Uri url = Uri.https('placebear.com',"/$height/$width");
    state.whenData((value) {try{
      state = AsyncLoading();
      debugPrint(url.toString());
      Future<http.Response> response = http.get(url);
      response.then((res) {
        debugPrint("response 届いた");
        state = AsyncValue.data(value.copyWith(image: res.bodyBytes));
      });
    }
    catch(_ClientSocketException) {
      state.whenData((value) => state = AsyncValue.data(value.copyWith(errorText: "インターネットに接続できません")));
    }
    });
  }

  Future<void> setKumaState(int height, int width) async {
    state.when(data: (data) {
      debugPrint(data.height.toString());
      state = AsyncValue.data(data.copyWith(height: height, width: width));
    },
    error: (_,__) => debugPrint("error"), 
    loading: () => debugPrint("loadiggg"));
  }

  void setErrorString(String text) {
    state.whenData((value) =>
      state = AsyncValue.data(value.copyWith(errorText: text.toString()))
    );
  }

}