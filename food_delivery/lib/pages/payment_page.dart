import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery/Components/My_button.dart';
import 'package:food_delivery/pages/delivery_process_page.dart'; // Assuming this is the import for the next page

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  // User wants to pay
  void userTappedPay() {
    if (formKey.currentState?.validate() ?? false) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm payment'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Card Number: $cardNumber'),
                Text('Expiry Date: $expiryDate'),
                Text('Card Holder: $cardHolderName'),
                Text('CVV: $cvvCode'),
              ],
            ),
          ),
          actions: [
            // Cancel button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            // Yes button
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DeliveryProcessPage()),
              ),
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        // Ensures content is scrollable
        child: Column(
          children: [
            // Credit Card Display
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (CreditCardBrand brand) {
                // Optionally handle brand change
              },
            ),
            // Credit Card Form
            CreditCardForm(
              formKey: formKey,
              onCreditCardModelChange: (CreditCardModel data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                  isCvvFocused = data.isCvvFocused;
                });
              },
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
            ),
            // Spacer to push button to the bottom
            const SizedBox(height: 25),
            // Pay Now Button
            MyButton(
              onTap: userTappedPay,
              text: "Pay Now",
            ),
            const SizedBox(height: 25), // Additional spacing below the button
          ],
        ),
      ),
    );
  }
}
