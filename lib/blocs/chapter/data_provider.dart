part of 'cubit.dart';

class ChapterDataProvider {
  static final cache = Hive.box('data');

  static Future<List<Chapter?>?> chapterApi() async {
    try {
      final resp = await Api.ins.get(
        '/v1/quran/quran-uthmani',
      );
      final Map<String, dynamic> raw = resp.data['data'];

      final List data = raw['surahs'];
      final chapters = List<Chapter>.generate(
        data.length,
        (index) => Chapter.fromJson(data[index]),
      );
      await cache.put(
        'chapters',
        chapters,
      );

      return chapters;
    } on DioExceptionType catch (e) {
      if (e == DioExceptionType.connectionTimeout) {
        throw Exception('Problem with internet connection');
      } else {
        throw Exception('Problem on our side, Please try again');
      }
    } catch (e) {
      throw Exception('Internal Server Error');
    }
  }

  static Future<List<Chapter?>?> chapterHive() async {
    try {
      final chapter = await cache.get('chapters');

      if (chapter == null) return null;

      final chapters = List<Chapter?>.from(chapter);

      return chapters;
    } catch (e) {
      throw Exception('Internal Server Error');
    }
  }
}
