import 'package:abkar/view/commonComponents/common_button.dart';
import 'package:abkar/view/commonComponents/common_text_field.dart';
import 'package:abkar/view/commonComponents/core/utils/constants.dart';
import 'package:abkar/view/commonComponents/divider.dart';
import 'package:abkar/view/commonComponents/galaxy_text.dart';
import 'package:abkar/view/commonComponents/google_facebook_container.dart';
import 'package:abkar/view/commonComponents/omnes_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../commonComponents/core/utils/size_config.dart';
import '../commonComponents/core/utils/styles.dart';
import '../page6/page6_screen.dart';

class Page3 extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
   Page3({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: mainPageColor,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              Positioned(
                  top: 38,
                  right: 90,
                  left: 89,
                  child: GalaxyText(
                    fontSize: 36,
                    text: 'تسجيل  الدخول',
                  )),
              Positioned(
                  top: 78,
                  right: 58,
                  left: 58,
                  child: SvgPicture.asset('assets/images/yellowLogin.svg')),
              const Positioned(
                  top: 108,
                  right: 69,
                  left: 97,
                  child: Image(image: AssetImage('assets/images/boy.png'))),
              Positioned(
                  top: 290,
                  right: 16,
                  left: 16,
                  child: CommonTextField(title: 'البريد الالكتروني',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' البريد الالكتروني مطلوب' ;}
                        else if (!value.endsWith('.com')) {
                          return 'البريد الالكتروني يجب ان ينتهي ب .com';}
                      }, controller:emailController
                  )),
              Positioned(
                  top: 360,
                  right: 16,
                  left: 16,
                  child: CommonTextField(title: 'كلمة المرور',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'كلمة المرور مطلوبة';}
                        //else if (value.length < 8) {
                        //  return 'password must be 8 characters or more';}
                      }, controller: passwordController)),
              const Positioned(
                top: 450,
                right: 14,
                left: 200,
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: Styles.style20r,
                ),
              ),
              Positioned(
                  top: 500,
                  right: 16,
                  left: 16,
                  child: CommonButton(
                      fun: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page6(),
                            ),
                                (route) => false);
                      },
                      buttonColor: mainGreen,
                      text: 'تسجيل الدخول')),
              Positioned(
                  top: 560,
                  left: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: OmnesText(
                              text: ' انشاء حساب جديد', color: mainGreen)),
                      const SizedBox(
                        width: 5,
                      ),
                      OmnesText(
                          text: ' ليس لديك حساب ؟ ', color: Colors.white)
                    ],
                  )),
              const Positioned(
                  top: 615, right: 16, left: 16, child: DividerComponent()),
              Positioned(
                  top: 653,
                  right: 16,
                  left: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GoogleFacebookContainer(
                        text: 'فيسبوك',
                        logo: 'assets/images/facebook.png',
                      ),
                      GoogleFacebookContainer(
                        text: 'جــــوجـل',
                        logo: 'assets/images/google.png',
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
