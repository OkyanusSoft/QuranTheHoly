import 'package:al_quran/static/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:al_quran/providers/app_provider.dart';

class DrawerAppName extends StatelessWidget {
  const DrawerAppName({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    final height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '\nThe',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: height * 0.025,
                color: appProvider.isDark ? Colors.grey[200] : Colors.black54,
              ),
            ),
            Text(
              "Holy\nQur'an",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: appProvider.isDark ? Colors.grey[200] : Colors.black54,
                fontSize: height * 0.035,
              ),
            ),
          ],
        ),
        Image.asset(
          StaticAssets.logosGradLogo,
          height: height * 0.17,
        ),
      ],
    );
  }
}
