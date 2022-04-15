import 'package:al_quran/animations/bottom_animation.dart';
import 'package:al_quran/cubits/chapter_data/cubit.dart';
import 'package:al_quran/models/chapter_data.dart';
import 'package:al_quran/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:al_quran/widgets/flare.dart';
import 'package:al_quran/widgets/title.dart';
import 'package:al_quran/widgets/custom_back_button.dart';
import 'package:al_quran/widgets/custom_image.dart';
import 'package:al_quran/providers/theme/theme_provider.dart';

part 'widgets/surah_information.dart';

class SurahIndexScreen extends StatefulWidget {
  const SurahIndexScreen({Key? key}) : super(key: key);

  @override
  State<SurahIndexScreen> createState() => _SurahIndexScreenState();
}

class _SurahIndexScreenState extends State<SurahIndexScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final chaptersDataCubit = ChapterDataCubit.cubit(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CustomImage(
              opacity: 0.3,
              height: height * 0.17,
              imagePath: StaticAssets.kaba,
            ),
            const CustomBackButton(),
            const CustomTitle(
              title: 'Surah Index',
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.2,
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: Color(0xffee8f8b),
                ),
                itemCount: chaptersDataCubit.state.data!.length,
                itemBuilder: (context, index) {
                  final chapter = chaptersDataCubit.state.data![index];
                  return WidgetAnimator(
                    child: ListTile(
                      minLeadingWidth: 15.0,
                      leading: Text(chapter.id!.toString()),
                      title: Text(
                        chapter.nameSimple!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(chapter.translatedName!),
                      trailing: Text(
                        chapter.nameArabic!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {},
                      onLongPress: () => showDialog(
                        context: context,
                        builder: (context) => _SurahInformation(
                          chapterData: chapter,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (themeChange.darkTheme) ...[
              Flare(
                color: const Color(0xfff9e9b8),
                offset: Offset(width, -height),
                bottom: -50,
                flareDuration: const Duration(seconds: 17),
                left: 100,
                height: 60,
                width: 60,
              ),
              Flare(
                color: const Color(0xfff9e9b8),
                offset: Offset(width, -height),
                bottom: -50,
                flareDuration: const Duration(seconds: 12),
                left: 10,
                height: 25,
                width: 25,
              ),
              Flare(
                color: const Color(0xfff9e9b8),
                offset: Offset(width, -height),
                bottom: -40,
                left: -100,
                flareDuration: const Duration(seconds: 18),
                height: 50,
                width: 50,
              ),
              Flare(
                color: const Color(0xfff9e9b8),
                offset: Offset(width, -height),
                bottom: -50,
                left: -80,
                flareDuration: const Duration(seconds: 15),
                height: 50,
                width: 50,
              ),
              Flare(
                color: const Color(0xfff9e9b8),
                offset: Offset(width, -height),
                bottom: -20,
                left: -120,
                flareDuration: const Duration(seconds: 12),
                height: 40,
                width: 40,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
