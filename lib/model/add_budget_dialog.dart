import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddBudgetDialog extends StatefulWidget {
  final Function(double) budgetToAdd;
  const AddBudgetDialog({Key? key, required this.budgetToAdd})
      : super(key: key);

  @override
  State<AddBudgetDialog> createState() => _AddBudgetDialogState();
}

class _AddBudgetDialogState extends State<AddBudgetDialog> {
  final TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.3,
        height: 200,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add a Budget",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(hintText: "Budget in \₹"),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  if (amountController.text.isNotEmpty) {
                    widget.budgetToAdd(double.parse(amountController.text));
                    Navigator.pop(context);
                  }
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
