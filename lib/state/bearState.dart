import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bearState.freezed.dart';
/// The response of the `GET /api/activity` endpoint.
///
/// It is defined using `freezed` and `json_serializable`.
@freezed
class BearState with _$BearState {
  factory BearState({
    Uint8List? image, //image用の変数を加えました
    required int width,
    required int height,
    String? errorText, //これはテキストフィールドに数字以外が入力された時にエラーメッセージを入れる用　
  }) = _BearState;

  /// Convert a JSON object into an [Activity] instance.
  /// This enables type-safe reading of the API response.
  //factory BearState.fromJson(Map<String, dynamic> json) =>
  //    _$BearStateFromJson(json);
}