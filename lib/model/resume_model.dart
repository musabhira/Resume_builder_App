import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_builder_app/model/resume_sections.dart';

part 'resume_model.freezed.dart';
part 'resume_model.g.dart';

@freezed
class ResumeModel with _$ResumeModel {
  factory ResumeModel({
    required List<ResumeSections> sections,
    required String name,
  }) = _ResumeModel;

  factory ResumeModel.fromJson(Map<String, Object?> json) =>
      _$ResumeModelFromJson(json);
}
