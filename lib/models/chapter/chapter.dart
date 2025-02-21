import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:al_quran/models/ayah/ayah.dart';
import 'package:al_quran/static/hive.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Chapter with _$Chapter {
  const Chapter._();

  @HiveType(
    typeId: AppHiveTypes.chapter,
    adapterName: 'ChapterAdapter',
  )
  const factory Chapter({
    @HiveField(0) int? number,
    @HiveField(1) String? name,
    @HiveField(2) String? englishName,
    @HiveField(3) String? englishNameTranslation,
    @HiveField(4) String? revelationType,
    @HiveField(5) List<Ayah?>? ayahs,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}
