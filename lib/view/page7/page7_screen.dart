import 'package:abkar/view/commonComponents/core/utils/size_config.dart';
import 'package:abkar/view/page27/page27_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../commonComponents/common_button.dart';
import '../commonComponents/core/utils/constants.dart';
import '../commonComponents/galaxy_text.dart';
import '../commonComponents/omnes_text.dart';
class Page7 extends StatelessWidget {
  const Page7({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(backgroundColor: mainPageColor,
      body: SafeArea(child:Stack(
        children: [
          Positioned(top: 126,
              right: 29,
              left: 39,
              child: SvgPicture.asset('assets/images/yellowParents.svg')),
          Positioned(
              top: 210,
              right: 66,
              left: 75,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GalaxyText(
                    fontSize: 48,
                    text: 'اعطي الهاتف ',
                  ),
                  SizedBox(height: SizeConfig.screenHeight!*0.08,),
                  GalaxyText(fontSize: 48, text: 'لوالديك')
                ],
              )),
          Positioned(
              bottom: 207,
              right: 53,
              left: 53,
              child: CommonButton(fun: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => const Page27(),), (route) => false);
              },
                  buttonColor: mainGreen, text: 'انشاء حساب جديد')),
          Positioned(
              bottom: 153,
              right: 53,
              left: 53,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 GestureDetector(
                      onTap: () {  },
                      child: OmnesText(text: ' تــــســــــجـــيــــل الـــدخــــول',color:mainGreen)),
                  const SizedBox(width: 5,),
                  OmnesText(text: ' لديك حساب ؟',color: Colors.white)
                ],
              )),
        ],
      )),
    );
  }
}
