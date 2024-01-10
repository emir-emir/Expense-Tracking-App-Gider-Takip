import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewExpenseController extends GetxController {
  var thema = true.obs;

  var selectDate = DateTime.now().obs;
  var selectedCategory = Category.Seyahat.obs;
  final List<ExpenseModel> registeredExpenses = [
    ExpenseModel(title: "Flutter Course", amount: 19.99, date: DateTime.now(), category: Category.Yemek),
    ExpenseModel(title: "Cinema", amount: 15.99, date: DateTime.now(), category: Category.Eglence),
  ].obs;
  Future<void> presentDatePicker() async {
    final firstDate = DateTime(selectDate.value.year - 1, selectDate.value.month, selectDate.value.day);

    var pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectDate.value,
      firstDate: firstDate,
      lastDate: DateTime(2050),
    );
    selectDate.value = pickedDate!;
  }
}
