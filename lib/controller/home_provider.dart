import 'dart:convert';
import 'dart:developer';
import 'package:resume_builder_app/model/resume_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_provider.g.dart';

@riverpod
class Home extends _$Home {
  @override
  List<ResumeModel> build() {
    SharedPreferences.getInstance().then((sharedPrefs) {
      final keys = sharedPrefs.getKeys();
      final resumeList = <ResumeModel>[];

      for (final key in keys) {
        try {
          resumeList.add(
              ResumeModel.fromJson(jsonDecode(sharedPrefs.getString(key)!)));
        } catch (e) {
          log('Cannot get resume with key : $key');
        }
      }

      state = resumeList;
    });

    return [];
  }

  /// Add new resume
  void add(ResumeModel resume) async {
    (await SharedPreferences.getInstance())
        .setString(resume.name, jsonEncode(resume.toJson()));
    state = [...state, resume];
  }

  /// Edit resume
  void edit(ResumeModel resume, int index) async {
    final sharedPrefs = await SharedPreferences.getInstance();

    sharedPrefs.remove(state[index].name);
    sharedPrefs.setString(resume.name, jsonEncode(resume.toJson()));

    final updatedResumeList = [...state];
    updatedResumeList[index] = resume;

    state = updatedResumeList;
  }

  /// remove the resume
  void remove(int index) async {
    (await SharedPreferences.getInstance()).remove(state[index].name);
    state = [...state]..removeAt(index);
  }
}
