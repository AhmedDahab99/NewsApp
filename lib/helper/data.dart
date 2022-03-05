import 'package:news_demo_app/model/CategoryModel.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel  = new CategoryModel();
  // business
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl = 'https://images.unsplash.com/39/lIZrwvbeRuuzqOoWJUEn_Photoaday_CSD%20(1%20of%201)-5.jpg?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //entertainment
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1496381273223-e4ad4e99f5b6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //general
  categoryModel.categoryName = 'General';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1602288637781-5ca78e8af9d4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //health
  categoryModel.categoryName = 'Health';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1542736667-069246bdbc6d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //sports
  categoryModel.categoryName = 'Sports';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1431324155629-1a6deb1dec8d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //technology
  categoryModel.categoryName = 'Technology';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1504384764586-bb4cdc1707b0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.categoryName="science";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1532094349884-543bc11b234d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  category.add(categoryModel);

  return category;
}