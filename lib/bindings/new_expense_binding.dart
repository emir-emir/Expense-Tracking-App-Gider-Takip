import 'package:expense_tracker/controllers/new_expense_controller.dart';
import 'package:get/get.dart';

class NewExpenseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<NewExpenseController>(NewExpenseController(), permanent: true);
    // Get.lazyPut(() => NewExpenseController(), fenix: true);
  }
}
