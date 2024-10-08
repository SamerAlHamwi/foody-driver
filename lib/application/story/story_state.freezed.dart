// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoryState {
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryStateCopyWith<StoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryStateCopyWith<$Res> {
  factory $StoryStateCopyWith(
          StoryState value, $Res Function(StoryState) then) =
      _$StoryStateCopyWithImpl<$Res, StoryState>;
  @useResult
  $Res call({int currentIndex});
}

/// @nodoc
class _$StoryStateCopyWithImpl<$Res, $Val extends StoryState>
    implements $StoryStateCopyWith<$Res> {
  _$StoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
  }) {
    return _then(_value.copyWith(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryStateImplCopyWith<$Res>
    implements $StoryStateCopyWith<$Res> {
  factory _$$StoryStateImplCopyWith(
          _$StoryStateImpl value, $Res Function(_$StoryStateImpl) then) =
      __$$StoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentIndex});
}

/// @nodoc
class __$$StoryStateImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$StoryStateImpl>
    implements _$$StoryStateImplCopyWith<$Res> {
  __$$StoryStateImplCopyWithImpl(
      _$StoryStateImpl _value, $Res Function(_$StoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
  }) {
    return _then(_$StoryStateImpl(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StoryStateImpl extends _StoryState {
  const _$StoryStateImpl({this.currentIndex = 0}) : super._();

  @override
  @JsonKey()
  final int currentIndex;

  @override
  String toString() {
    return 'StoryState(currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryStateImpl &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryStateImplCopyWith<_$StoryStateImpl> get copyWith =>
      __$$StoryStateImplCopyWithImpl<_$StoryStateImpl>(this, _$identity);
}

abstract class _StoryState extends StoryState {
  const factory _StoryState({final int currentIndex}) = _$StoryStateImpl;
  const _StoryState._() : super._();

  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$$StoryStateImplCopyWith<_$StoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
