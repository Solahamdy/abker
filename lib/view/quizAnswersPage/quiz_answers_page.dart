import 'package:abkar/view/quizAnswersPage/components/quiz_answers_page_app_bar.dart';
import 'package:flutter/material.dart';
import '../../model/quiz_model.dart';
import '../commonComponents/common_smaller_button.dart';
import '../commonComponents/core/utils/constants.dart';
import '../commonComponents/core/utils/styles.dart';
import '../page2/page2_screen.dart';
import '../quizPage/quiz_page.dart';

class QuizAnswersPage extends StatelessWidget {
  final List<QuizQuestion> quizQuestions;
  final List<int?> selectedAnswers;

  QuizAnswersPage({
    required this.quizQuestions,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainPageColor,
      appBar: quizAnswersAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: quizQuestions.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, right: 20, left: 20, bottom: 10),
                        child: Text(
                          quizQuestions[index].questionText ?? '',
                          maxLines: 3,
                          softWrap: true,
                          style: Styles.style20b600,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(3, (answerIndex) {
                          String answerText;
                          bool isCorrect = false;
                          switch (answerIndex) {
                            case 0:
                              answerText =
                                  quizQuestions[index].answerOneText ?? '';
                              isCorrect =
                                  quizQuestions[index].answerOneIsCorrect ==
                                      "1";
                              break;
                            case 1:
                              answerText =
                                  quizQuestions[index].answerTwoText ?? '';
                              isCorrect =
                                  quizQuestions[index].answerTwoIsCorrect ==
                                      "1";
                              break;
                            case 2:
                              answerText =
                                  quizQuestions[index].answerThreeText ?? '';
                              isCorrect =
                                  quizQuestions[index].answerThreeIsCorrect ==
                                      "1";
                              break;
                            default:
                              answerText = '';
                          }

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  answerText,
                                  style: Styles.style20b500,
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: selectedAnswers[index] == answerIndex
                                        ? isCorrect
                                            ? mainGreen
                                            : mainRed
                                        : isCorrect
                                            ? mainGreen
                                            : mainPageColor,
                                    border: Border.all(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonSmallerButton(
                    buttonColor: mainRed,
                    text: 'السابق',
                    fun: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                QuizPage(quizQuestions: quizQuestions),
                          ),
                          (route) => false);
                    },
                  ),
                  CommonSmallerButton(
                    buttonColor: mainGreen,
                    text: 'التالي',
                    fun: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Page2(),
                          ),
                          (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
