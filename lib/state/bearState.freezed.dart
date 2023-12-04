// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bearState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BearState {
  Uint8List? get image => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BearStateCopyWith<BearState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BearStateCopyWith<$Res> {
  factory $BearStateCopyWith(BearState value, $Res Function(BearState) then) =
      _$BearStateCopyWithImpl<$Res, BearState>;
  @useResult
  $Res call({Uint8List? image, int width, int height, String? errorText});
}

/// @nodoc
class _$BearStateCopyWithImpl<$Res, $Val extends BearState>
    implements $BearStateCopyWith<$Res> {
  _$BearStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? width = null,
    Object? height = null,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BearStateImplCopyWith<$Res>
    implements $BearStateCopyWith<$Res> {
  factory _$$BearStateImplCopyWith(
          _$BearStateImpl value, $Res Function(_$BearStateImpl) then) =
      __$$BearStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uint8List? image, int width, int height, String? errorText});
}

/// @nodoc
class __$$BearStateImplCopyWithImpl<$Res>
    extends _$BearStateCopyWithImpl<$Res, _$BearStateImpl>
    implements _$$BearStateImplCopyWith<$Res> {
  __$$BearStateImplCopyWithImpl(
      _$BearStateImpl _value, $Res Function(_$BearStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? width = null,
    Object? height = null,
    Object? errorText = freezed,
  }) {
    return _then(_$BearStateImpl(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BearStateImpl implements _BearState {
  _$BearStateImpl(
      {this.image, required this.width, required this.height, this.errorText});

  @override
  final Uint8List? image;
  @override
  final int width;
  @override
  final int height;
  @override
  final String? errorText;

  @override
  String toString() {
    return 'BearState(image: $image, width: $width, height: $height, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BearStateImpl &&
            const DeepCollectionEquality().equals(other.image, image) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(image), width, height, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BearStateImplCopyWith<_$BearStateImpl> get copyWith =>
      __$$BearStateImplCopyWithImpl<_$BearStateImpl>(this, _$identity);
}

abstract class _BearState implements BearState {
  factory _BearState(
      {final Uint8List? image,
      required final int width,
      required final int height,
      final String? errorText}) = _$BearStateImpl;

  @override
  Uint8List? get image;
  @override
  int get width;
  @override
  int get height;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$$BearStateImplCopyWith<_$BearStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
