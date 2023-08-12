import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';

class ShowSnackBar {
  void showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: MyColors.white,
        content: Text(
          content,
          style: MyTextStyles.spaceGrotesk15regular400black,
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(
          bottom: 20,
          right: 20,
          left: 20,
        ),
      ),
    );
  }
}
