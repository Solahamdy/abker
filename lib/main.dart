
import 'package:abkar/view/page2/page2_screen.dart';
import 'package:abkar/view/quizPage/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/quiz_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
       const MaterialApp(
       debugShowCheckedModeBanner: false,
        home: Page2(),
         ));
}


