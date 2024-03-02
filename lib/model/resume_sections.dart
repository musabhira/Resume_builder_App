import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume_sections.freezed.dart';
part 'resume_sections.g.dart';

@freezed
class ResumeSections with _$ResumeSections {
  factory ResumeSections({
    required String title,
    required String content,
  }) = _ResumeSections;

  factory ResumeSections.fromJson(Map<String, Object?> json) =>
      _$ResumeSectionsFromJson(json);
}
