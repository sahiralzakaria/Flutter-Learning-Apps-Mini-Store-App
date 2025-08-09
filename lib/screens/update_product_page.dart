import 'package:app07/widgets/custom_buton.dart';
import 'package:app07/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class UpdateProductPage extends StatelessWidget {
  const UpdateProductPage({super.key});
  static String id = 'UpdatePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Product',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextFormField(hint: 'Product Name'),
            SizedBox(height: 16),
            CustomTextFormField(hint: 'Description'),
            SizedBox(height: 16),
            CustomTextFormField(hint: 'Price'),
            SizedBox(height: 16),
            CustomTextFormField(hint: 'Image'),
            SizedBox(height: 15),
            CustomButon(color: Colors.deepPurple, text: "Update"),
          ],
        ),
      ),
    );
  }
}
