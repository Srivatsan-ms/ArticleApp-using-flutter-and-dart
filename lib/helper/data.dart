import 'package:firstapp/modelfile/categorymodel.dart';

List<Categorymodel> getCategories() {
  List<Categorymodel> category = new List<Categorymodel>();
  Categorymodel categorymodel = new Categorymodel();

  categorymodel.categoryName = "Business";
  categorymodel.imageUrl =
      "https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categorymodel);

  categorymodel = new Categorymodel();
  categorymodel.categoryName = "Technology";
  categorymodel.imageUrl =
      "https://images.unsplash.com/photo-1496171367470-9ed9a91ea931?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categorymodel);

  categorymodel = new Categorymodel();
  categorymodel.categoryName = "Entertainment";
  categorymodel.imageUrl =
      "https://images.unsplash.com/photo-1560169897-fc0cdbdfa4d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categorymodel);

  categorymodel = new Categorymodel();
  categorymodel.categoryName = "General";
  categorymodel.imageUrl =
      "https://images.unsplash.com/photo-1489533119213-66a5cd877091?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categorymodel);

  categorymodel = new Categorymodel();
  categorymodel.categoryName = "Sports";
  categorymodel.imageUrl =
      "https://images.unsplash.com/photo-1495555687398-3f50d6e79e1e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categorymodel);

  categorymodel = new Categorymodel();
  categorymodel.categoryName = "Health";
  categorymodel.imageUrl =
      "https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categorymodel);
  return category;
}
