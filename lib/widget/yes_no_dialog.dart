import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_screen_task/styles/colors.dart';
 
class YesNoDialog extends StatelessWidget {
  final String dialogText;
  final void Function() onYesPressed;
  final void Function() onNoPressed;

  const YesNoDialog({
    super.key,
    required this.dialogText,
    required this.onYesPressed,
    required this.onNoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(24, 15, 24, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      title: Text(
        dialogText,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.sp, color: mainBlue),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(mainBlue),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            onPressed: onYesPressed,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Text(
                'Yes',
                textAlign: TextAlign.center,
                style: TextStyle(color: white),
              ),
            ),
          ),
          SizedBox(height: 4.h),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: const BorderSide(color: mainBlue),
                ),
              ),
            ),
            onPressed: onNoPressed,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Text(
                'No',
                textAlign: TextAlign.center,
                style: TextStyle(color: mainBlue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
