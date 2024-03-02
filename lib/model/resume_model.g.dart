// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResumeModelImpl _$$ResumeModelImplFromJson(Map<String, dynamic> json) =>
    _$ResumeModelImpl(
      sections: (json['sections'] as List<dynamic>)
          .map((e) => ResumeSections.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ResumeModelImplToJson(_$ResumeModelImpl instance) =>
    <String, dynamic>{
      'sections': instance.sections,
      'name': instance.name,
    };
