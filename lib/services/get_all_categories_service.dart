import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async{
    List<dynamic> categories = await Api().getRequest(url: 'https://fakestoreapi.com/products/categories');
    return categories;
  }
}
