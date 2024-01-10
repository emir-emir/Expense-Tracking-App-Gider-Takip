import 'package:expense_tracker/widgets/expenses.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: Expenses.routename, page: () => Expenses()
      // binding: NewExpenseBinding(),
      ),
];
// List<GetPage<dynamic>> routes = [
//   GetPage(name: '/', page: () => HomePage()),
//   GetPage(name: '/quiz', page: () => Quiz()),
//   GetPage(name: '/questionsScreen', page: () => QuestionsScreen()),
// ];
