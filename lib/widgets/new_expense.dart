import 'package:expense_tracker/controllers/new_expense_controller.dart';
import 'package:expense_tracker/extensions/context_extension.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(ExpenseModel expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  NewExpenseController newExpenseController = Get.put(NewExpenseController());
  var titleController = TextEditingController().obs;
  var amountController = TextEditingController().obs;

  @override
  void dispose() {
    titleController.value.dispose();
    amountController.value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;
      print(constraints.minWidth);
      print(constraints.maxWidth);
      print(constraints.minHeight);
      print(constraints.maxHeight);

      return Obx(() => SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
                child: Column(
                  children: [
                    if (width >= 600)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: titleController.value,
                              maxLength: 50,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                label: Text("Başlık"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: TextField(
                              controller: amountController.value,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                prefixText: "\$ ",
                                label: Text("Miktar"),
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      TextField(
                        controller: titleController.value,
                        maxLength: 50,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          label: Text("Başlık"),
                        ),
                      ),
                    if (width >= 600)
                      Row(
                        children: [
                          DropdownButton(
                              value: newExpenseController.selectedCategory.value,
                              items: Category.values
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e.name.toUpperCase(),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                if (value == null) {
                                  return;
                                }
                                newExpenseController.selectedCategory.value = value;
                              }),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(newExpenseController.selectDate.value == null ? "Tarih Seçilmedi" : formatter.format(newExpenseController.selectDate.value)),
                                IconButton(
                                  onPressed: () {
                                    newExpenseController.presentDatePicker();
                                  },
                                  icon: const Icon(Icons.calendar_month),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: amountController.value,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                prefixText: "\$ ",
                                label: Text("Miktar"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(newExpenseController.selectDate.value == null ? "Tarih Seçilmedi" : formatter.format(newExpenseController.selectDate.value)),
                                IconButton(
                                  onPressed: () {
                                    newExpenseController.presentDatePicker();
                                  },
                                  icon: const Icon(Icons.calendar_month),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    const SizedBox(height: 15),
                    if (width >= 600)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("İptal Et"),
                          ),
                          30.SizedBoxWidth,
                          ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE0CCFD))),
                            onPressed: submitExpenseData,
                            child: const Text("Kaydet"),
                          ),
                        ],
                      )
                    else
                      Obx(() => Row(
                            children: [
                              DropdownButton(
                                  value: newExpenseController.selectedCategory.value,
                                  items: Category.values
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e.name.toUpperCase(),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    if (value == null) {
                                      return;
                                    }
                                    newExpenseController.selectedCategory.value = value;
                                  }),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("İptal Et"),
                              ),
                              Spacer(),
                              ElevatedButton(
                                onPressed: submitExpenseData,
                                child: const Text("Kaydet"),
                              ),
                            ],
                          ))
                  ],
                ),
              ),
            ),
          ));
    });
  }

  submitExpenseData() {
    final enteredAmount = double.tryParse(amountController.value.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (titleController.value.text.trim().isEmpty || amountIsInvalid || newExpenseController.selectDate == null) {
      Get.defaultDialog(title: "Geçersiz Giriş", content: const Text("lütfen geçerli bir Başlık, Fiyat, Tarih ve Kategorinin girildiğinden emin olun"), confirmTextColor: Colors.white, actions: [
        SizedBox(width: 200),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Tamam"),
        ),
      ]);
      return;
    } else {
      Get.back();
    }

    widget.onAddExpense(
      ExpenseModel(title: titleController.value.text, amount: enteredAmount, date: newExpenseController.selectDate.value, category: newExpenseController.selectedCategory.value),
    );
  }
}
