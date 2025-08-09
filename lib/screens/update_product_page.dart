import 'package:app07/models/product_model.dart';
import 'package:app07/services/update_product.dart';
import 'package:app07/widgets/custom_buton.dart';
import 'package:app07/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'UpdatePage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;
  bool isLoading = false;
  String? price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                CustomTextField(
                  hint: 'Product Name',
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: 'Description',
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: 'Price',
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: 'Image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                SizedBox(height: 50),
                CustomButon(
                  color: Colors.deepPurple,
                  text: "Update",
                  onTap: () async {
                    isLoading = true;
                    await updateProduct(product);
                    setState(() {
                      isLoading = false;
                    });

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      id: product.id,
      category: product.category,
    );
  }
}
