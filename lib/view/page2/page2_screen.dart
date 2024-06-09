import 'package:abkar/controller/controllers/controllers.dart';
import 'package:abkar/view/commonComponents/common_button.dart';
import 'package:abkar/view/commonComponents/core/utils/constants.dart';
import 'package:abkar/view/commonComponents/galaxy_text.dart';
import 'package:abkar/view/quizPage/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../model/quiz_model.dart';
import '../commonComponents/core/utils/size_config.dart';
import '../page3/page3_screen.dart';

class Page2 extends StatelessWidget {

  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: mainPageColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 128,
                right: 42,
                left: 42,
                child: SvgPicture.asset('assets/images/yellowAge.svg')),
            Positioned(
                top: 218,
                right: 102,
                left: 102,
                child: GalaxyText(
                  text: 'كم عمرك',
                  fontSize: 48,
                )),
            Positioned(
                bottom: 222,
                right: 72,
                left: 72,
                child: CommonButton(
                  buttonColor: mainGreen,
                  text: '6 - 12',
                  fun: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Page3(),
                        ),
                        (route) => false);
                  },
                )),
            Positioned(
                bottom: 124,
                right: 72,
                left: 72,
                child: CommonButton(
                  buttonColor: mainRed,
                  text: '13 - 18',
                  fun: () async {
                    List<QuizQuestion> x =  await createTest('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xLjk6NTAwMC9hcGkvbG9naW4iLCJpYXQiOjE3MTc4ODE1MzksImV4cCI6MTcxNzg4NTEzOSwibmJmIjoxNzE3ODgxNTM5LCJqdGkiOiJZRGpJNkk1ZE03UjFlVDdzIiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.ZH7p7lcBepPzdQoXjiKyt9m9SQMkVpfsEmaBdvHl3SE');
                    for(QuizQuestion i in x ){
                      print(i.questionText);
                    }
                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) =>  QuizPage(quizQuestions: x ),), (route) => false);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
