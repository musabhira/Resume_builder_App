// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume_sections.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResumeSections _$ResumeSectionsFromJson(Map<String, dynamic> json) {
  return _ResumeSections.fromJson(json);
}

/// @nodoc
mixin _$ResumeSections {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResumeSectionsCopyWith<ResumeSections> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResumeSectionsCopyWith<$Res> {
  factory $ResumeSectionsCopyWith(
          ResumeSections value, $Res Function(ResumeSections) then) =
      _$ResumeSectionsCopyWithImpl<$Res, ResumeSections>;
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class _$ResumeSectionsCopyWithImpl<$Res, $Val extends ResumeSections>
    implements $ResumeSectionsCopyWith<$Res> {
  _$ResumeSectionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResumeSectionsImplCopyWith<$Res>
    implements $ResumeSectionsCopyWith<$Res> {
  factory _$$ResumeSectionsImplCopyWith(_$ResumeSectionsImpl value,
          $Res Function(_$ResumeSectionsImpl) then) =
      __$$ResumeSectionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class __$$ResumeSectionsImplCopyWithImpl<$Res>
    extends _$ResumeSectionsCopyWithImpl<$Res, _$ResumeSectionsImpl>
    implements _$$ResumeSectionsImplCopyWith<$Res> {
  __$$ResumeSectionsImplCopyWithImpl(
      _$ResumeSectionsImpl _value, $Res Function(_$ResumeSectionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$ResumeSectionsImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResumeSectionsImpl implements _ResumeSections {
  _$ResumeSectionsImpl({required this.title, required this.content});

  factory _$ResumeSectionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResumeSectionsImplFromJson(json);

  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'ResumeSections(title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResumeSectionsImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResumeSectionsImplCopyWith<_$ResumeSectionsImpl> get copyWith =>
      __$$ResumeSectionsImplCopyWithImpl<_$ResumeSectionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResumeSectionsImplToJson(
      this,
    );
  }
}

abstract class _ResumeSections implements ResumeSections {
  factory _ResumeSections(
      {required final String title,
      required final String content}) = _$ResumeSectionsImpl;

  factory _ResumeSections.fromJson(Map<String, dynamic> json) =
      _$ResumeSectionsImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$ResumeSectionsImplCopyWith<_$ResumeSectionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
