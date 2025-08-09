import 'package:app07/models/product_model.dart';
import 'package:app07/services/get_all_product_service.dart';
import 'package:app07/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.cartShopping),
          ),
        ],
        backgroundColor: Colors.white,
        title: Text('New Trend'),
      ),

      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 60),

        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),

          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;

              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  mainAxisSpacing: 60,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(product: products[index]);
                },
              );
            } else {
              return Center(
                child: Text("data ::: ${snapshot.data.toString()}"),
              );
            }
          },
        ),
      ),
    );
  }
}
