import 'core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'core/utils/size_config.dart';
class CommonSmallerButton extends StatelessWidget {
  String text;
  var fun;
  Color buttonColor;
  CommonSmallerButton ( {required this.buttonColor,
    this.fun,
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: SizeConfig.screenHeight!*0.06,
      width: SizeConfig.screenWidth!*0.35,
      decoration: ShapeDecoration(
        color: buttonColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0xFF000000),
            blurRadius: 0,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: MaterialButton(
            onPressed: fun,
            child: Center(
                child: Text(
                 text,
                  style: Styles.style32w600,
                ))),
      ),
    );
  }
}
