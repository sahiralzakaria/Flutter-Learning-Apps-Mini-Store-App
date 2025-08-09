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
        child: GridView.builder(
          clipBehavior: Clip.none,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
            mainAxisSpacing: 60,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, builder) {
            return CustomCard();
          },
        ),
      ),
    );
  }
}
