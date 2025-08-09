import 'package:app07/helper/api.dart';
import 'package:app07/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getGategoriesProduct({
    required String categoryName,
  }) async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/category/$categoryName',
    );

    List<ProductModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
